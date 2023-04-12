import Chart from 'chart.js/auto'
import zoomPlugin from 'chartjs-plugin-zoom'
import PolynomialRegression from "js-polynomial-regression"
Chart.register(zoomPlugin);

function qMatrix(height) {
  return {
    "C1": {"C1": -100000.0*height, "C2": 100000.0*height, "C3": 0, "O": 0},
    "C2": {"C1": 50, "C2": -64, "C3": 4, "O": 10},
    "C3": {"C1": 0, "C2": 0.02, "C3": -0.02, "O": 0},
    "O": {"C1": 0, "C2": 0.5, "C3": 0.0, "O": -0.5},
  }
}

function drawTrace(data, elementID, timeStep, title, metadata){
  return new Chart(
    document.getElementById(elementID),
    {
      type: 'line',
      data: {
        labels: [...Array(data.length).keys()].map(x => (x * timeStep).toFixed(1)),
        datasets: [
          {
            label: "Current",
            data: data,
            pointRadius: 0,
            borderWidth: 1,
            borderColor: 'rgb(125, 99, 233)',
          }
        ]
      },
      options: {
        plugins: {
            title: {
                display: true,
                text: title
            },
            legend: {
                display: false
            }
        },
        scales: {
          y: {
            title: {
              display: true,
              text: 'Current (pA)'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Time (ms)'
            }
          },
        }
      }
    }
  )
}
const zoomOptions = {
  pan: {
    enabled: true,
    mode: 'y'
  },
  zoom: {
    mode: 'y',
    wheel: {
      enabled: true,
    },
    pinch: {
      enabled: true
    },
  }
};
function traceDataTransform(data, index){
  const colors = [
    'rgb(255, 99, 132)',
    'rgb(54, 162, 235)',
    'rgb(255, 205, 86)',
    'rgb(75, 192, 192)',
    'rgb(153, 102, 255)',
  ]
  return {
    label: "Current",
    data: data.map(x => x + (index* 1.5) + 1),
    pointRadius: 0,
    borderColor: colors[index % colors.length],
    borderWidth: 1,
  }
}
function drawTraces(data, elementID, timeStep, title, metadata){
  return new Chart(
    document.getElementById(elementID),
    {
      type: 'line',
      data: {
        labels: [...Array(data[0].length).keys()].map(x => (x * timeStep).toFixed(1)),
        datasets: data.map(traceDataTransform)
      },
      options: {
        events: [],
        plugins: {
            title: {
                display: true,
                text: title
            },
            legend: {
                display: false
            },
            zoom: zoomOptions,
        },
        scales: {
          y: {
            display: false,
            min: 0,
            title: {
              display: true,
              text: 'Current (pA)'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Time (ms)'
            }
          },
        }
      }
    }
  )
}
function modelPlotTransform(data, model){
  return data.map(({ x, y }) => ({x:x , y: model.predictY(model.getTerms(), parseFloat(x))})).sort((a, b) => a.x - b.x)
}
function drawScatter(elementID, dataset, model, title, metadata, modelVisibility){
  const data = {
    datasets: [{
      type: 'scatter',
      label: title,
      data: dataset,
      backgroundColor: 'rgb(255, 99, 132)',
      order: 2,
    },
    {
      label: "Model",
      type: 'line',
      data: modelPlotTransform(dataset, model),
      borderColor: 'rgb(54, 162, 235)',
      pointRadius: 0,
      order: 1,
      borderWidth: modelVisibility ? 2 : 0,
    }
  ]
  }
  return new Chart(
    document.getElementById(elementID),
    {
      //type: 'scatter',
      data: data,
      options: {
        scales: {
          x: {
            type: 'linear',
            position: 'bottom'
          }
        }
      },
      options: {
        plugins: {
            title: {
                display: true,
                text: title
            },
            legend: {
                display: false
            }
        },
        scales: {
          y: {
            title: {
              display: true,
              text: 'Variance (pA^2)'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Mean (pA)'
            }
          }
        }
      }
    }
  )
}
function updateScatter(chart, data, model, metadata, modelVisibility){
  chart.data.datasets[0].data = data
  chart.data.datasets[1].data = modelPlotTransform(data, model)
  chart.data.datasets[1].borderWidth = modelVisibility ? 2 : 0
  console.log(chart.data.datasets[1].data)
  //chart.options.plugins.subtitle.text = `ensemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
function updateTrace(chart, data, timeStep, metadata){
  chart.data.datasets[0].data = data
  chart.data.labels = [...Array(data.length).keys()].map(x => (x * timeStep).toFixed(1))
  //chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
function updateTraces(chart, data, timeStep, metadata){
  //data = data.slice(0, 5)
  chart.data.datasets = data.map(traceDataTransform)
  chart.data.labels = [...Array(data[0].length).keys()].map(x => (x * timeStep).toFixed(1))
  //chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}

function CVfit(data){
  const model = PolynomialRegression.read(data.map(({x, y}) => ({x: parseFloat(x), y: parseFloat(y)})), 2)
  return model
}

function defaultMetadata(){
  return {
    n: 20,
    ensembleSize: 5,
    samplingFrequency: 40,
    cutoffFrequency: 3,
    duration: 1,
    u: 0.07,
    maxTime: 10,
    height: 0.001,
    qMatrix: qMatrix,
    clist: {
      "C1": 0,
      "C2": 0,
      "C3": 0,
      "O": 8
    },
    initalState: "C1",
    timeStep: 0.02,
    singlechannelNoise: false,
    modelVisibility: false,
    randomSeed: 0,
  }
}
function defaultWatch(){
  return {
    n: "updateGraphs",
    nNum: "updateGraphs",
    ensembleSize: "updateGraphs",
    ensembleSizeNum: "updateGraphs",
    samplingFrequency:  "updateGraphs",
    cutoffFrequency: "updateGraphs",
    duration: "updateGraphs",
    durationNum: "updateGraphs",
    u: "updateGraphs",
    maxTime: "updateGraphs",
    maxTimeNum: "updateGraphs",
    height: "updateGraphs",
    clist: "updateGraphs",
    initalState: "updateGraphs",
    timeStep: "updateGraphs",
    singlechannelNoise: "updateGraphs",
    singlechannelNoiseNum: "updateGraphs",
    modelVisibility: "updateGraphs",
    randomSeed: "updateGraphs",
  }
}
function getMessage(metadata){
  return {
    ensembleSize: metadata.ensembleSize,
    qflatpulse: metadata.qflatpulse,
    qPause: metadata.qPause,
    clist: JSON.stringify(metadata.clist),
    initalState: metadata.initalState,
    duration: metadata.duration,
    n: metadata.n,
    u: metadata.u,
    timeStep: metadata.timeStep,
    maxTime: metadata.maxTime,
    samplingFrequency: metadata.samplingFrequency,
    cutoffFrequency: metadata.cutoffFrequency,
    singlechannelNoise: metadata.singlechannelNoise,
    randomSeed: metadata.randomSeed,
  }
}
function modelToString(){
  let terms = window.CVmodel.getTerms().map((x) => x.toFixed(4))
  let modelString = `Model Equation: <br> $$y = ${terms[2]}x^2 + ${terms[1]}x + ${terms[0]}$$`
  return modelString
}
function updateModelParams(update){
  if (update) {
    document.getElementById("modelParams").innerHTML = modelToString()
  }
  else {
    document.getElementById("modelParams").innerHTML = ""
  }
}
function defaultMethods(){
  return {
    drawGraphs() {
      worker.postMessage(getMessage(this))
      worker.onmessage = (e) => {
        window.singletraceGraph = drawTraces(e.data.singletraces, "singletraces", e.data.timeStep, "Single Trace Sweeps", e.data)
        window.meantraceGraph = drawTrace(e.data.meantrace, "meantrace", e.data.timeStep, "Mean Trace", e.data)
        window.CVmodel = CVfit(e.data.CVdata)
        window.CVgraph = drawScatter("CV", e.data.CVdata, window.CVmodel, "Variance Vs. Mean", e.data, this.modelVisibility)
        document.getElementById("stderr").innerHTML = "\\(" + e.data.stderror.toFixed(4) + "\\)"
        updateModelParams(this.modelVisibility)
        MathJax.typeset()
      }
    },
    updateGraphs() {
      worker.postMessage(getMessage(this))
      worker.onmessage = (e) => {
        window.CVmodel = CVfit(e.data.CVdata)
        updateTraces(window.singletraceGraph, e.data.singletraces, e.data.timeStep, e.data)
        updateTrace(window.meantraceGraph, e.data.meantrace, e.data.timeStep, e.data)
        updateScatter(window.CVgraph, e.data.CVdata, window.CVmodel, e.data, this.modelVisibility)
        updateModelParams(this.modelVisibility)
        document.getElementById("stderr").innerHTML = "\\(" + e.data.stderror.toFixed(4) + "\\)"
        MathJax.typeset()
      }
    }
  }
}
function setSliderCallbacks(metadata){
  let sliders = document.querySelectorAll("input[type='range'], input[type='number']")
  sliders.forEach((slider) => {
    slider.addEventListener("input", (event) => {
      let id = event.target.id
      if (id.endsWith("Num")) {
        id = id.slice(0, -3)
      }
      let value = parseFloat(event.target.value)
      metadata[id] = value
    })
  })
}
function setCheckboxCallbacks(metadata){
  let checkboxes = document.querySelectorAll("input[type='checkbox']")
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("change", (event) => {
      let id = event.target.id
      let value = event.target.checked
      metadata[id] = value
    })
  })
}
if (window.Worker) {
  var worker = new Worker(new URL('worker.js', import.meta.url))
}

const { createApp } = Vue
      
createApp({
  data() {
    return defaultMetadata()
  },
  watch: defaultWatch(),
  methods: defaultMethods(),
  mounted() {
    this.drawGraphs()
    setSliderCallbacks(this)
    setCheckboxCallbacks(this)
  },
  computed: {
    qflatpulse() {
      return qMatrix(this.height)
    },
    qPause() {
      return qMatrix(0)
    }
  }
}).mount('#vueApp')