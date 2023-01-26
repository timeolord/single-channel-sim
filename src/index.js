import Chart from 'chart.js/auto'

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
            borderColor: 'rgb(255, 99, 132)',
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
            },
            subtitle: {
              display: true,
              text: `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`,
              padding: {
                bottom: 20
              }
          },
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
    borderColor: colors[index],
    borderWidth: 1,
  }
}
function drawTraces(data, elementID, timeStep, title, metadata){
  //console.log([...Array(data[0].length).keys()].map(x => (x * timeStep).toFixed(1)))
  //console.log(data.map(traceDataTransform))
  data = data.slice(0, 5)
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
            subtitle: {
              display: true,
              text: `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`,
              padding: {
                bottom: 20
              }
          },
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
  data = {
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
            },
            subtitle: {
              display: true,
              text: `ensemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`,
              padding: {
                bottom: 20
              }
          },
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
  chart.options.plugins.subtitle.text = `ensemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
function updateTrace(chart, data, timeStep, metadata){
  chart.data.datasets[0].data = data
  chart.data.labels = [...Array(data.length).keys()].map(x => (x * timeStep).toFixed(1))
  chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
function updateTraces(chart, data, timeStep, metadata){
  data = data.slice(0, 5)
  chart.data.datasets = data.map(traceDataTransform)
  chart.data.labels = [...Array(data[0].length).keys()].map(x => (x * timeStep).toFixed(1))
  chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
import PolynomialRegression from "js-polynomial-regression"
function CVfit(data){
  let model = PolynomialRegression.read(data.map(({x, y}) => ({x: parseFloat(x), y: parseFloat(y)})), 2)
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
    ensembleSize: "updateGraphs",
    samplingFrequency:  "updateGraphs",
    cutoffFrequency: "updateGraphs",
    duration: "updateGraphs",
    u: "updateGraphs",
    maxTime: "updateGraphs",
    height: "updateGraphs", //TODO
    clist: "updateGraphs",
    initalState: "updateGraphs",
    timeStep: "updateGraphs",
    singlechannelNoise: "updateGraphs",
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
function defaultMethods(){
  
  return {
    drawGraphs() {
      worker.postMessage(getMessage(this))
      worker.onmessage = (e) => {
        //window.meangraph = drawTrace(e.data.meancurrent, "meancurrent", e.data.timeStep, "Mean Current", e.data)
        
        window.singletraceGraph = drawTraces(e.data.singletraces, "singletraces", e.data.timeStep, "Sample Single Trace Recordings", e.data)
        window.CVmodel = CVfit(e.data.CVdata)
        window.CVgraph = drawScatter("CV", e.data.CVdata, window.CVmodel, "Variance Vs. Mean", e.data, this.modelVisibility)
      }
    },
    updateGraphs() {
      worker.postMessage(getMessage(this))
      worker.onmessage = (e) => {
        //updateTrace(window.meangraph, e.data.meancurrent, e.data.timeStep, e.data)
        window.CVmodel = CVfit(e.data.CVdata)
        updateTraces(window.singletraceGraph, e.data.singletraces, e.data.timeStep, e.data)
        updateScatter(window.CVgraph, e.data.CVdata, window.CVmodel, e.data, this.modelVisibility)
      }
    }
  }
}
function setSliderCallbacks(metadata){
  let sliders = document.querySelectorAll("input[type='range']")
  sliders.forEach((slider) => {
    slider.addEventListener("input", (event) => {
      let id = event.target.id
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
//(async function() {
//  slider = document.getElementById("nRange");
//  slider.oninput = function() {
//    output.innerHTML = this.value;
//  }
//})()

//(async function() {
//  let height = 0.001;
//  let duration = 1;
//  let u = 0.07;
//  let tmax = 10;
//  let tstep = 0.2;
//  
//  let qflatpulse = qMatrix(height)
//  let qPause = qMatrix(0)
//  let clist = {
//    "C1": 0,
//    "C2": 0,
//    "C3": 0,
//    "O": 8
//  }
//  let initalState = "C1";
//  let n = 200
//  let s = meancurrent(qflatpulse, qPause, clist, initalState, duration, n, u, tmax, tstep)
//  let ensembleSize = 100
//  let samplingFrequency = 40
//  let cutoffFrequency = 3
//
//  let filtertestData = filtertest(ensembleSize, qflatpulse, qPause, clist, initalState, duration, u, tmax, samplingFrequency, cutoffFrequency)
//  drawTrace(filtertestData.filteredCurrent, "filtered", filtertestData.timeStep, "Filtered Mean Currents")
//  drawTrace(filtertestData.unfilteredCurrent, "unfiltered", filtertestData.timeStep, "Unfiltered Mean Currents")
//  let singletraceData = singletrace(qflatpulse, qPause, clist, initalState, duration, u, tmax, tstep)
//  drawTrace(singletraceData, "singletrace", tstep, "Single Trace Current")
//  let meancurrentData = meancurrent(qflatpulse, qPause, clist, initalState, duration, n, u, tmax, tstep)
//  drawTrace(meancurrentData, "meancurrent", tstep, "Mean Current")
//})()