import Chart from 'chart.js/auto'
import zoomPlugin from 'chartjs-plugin-zoom'
Chart.register(zoomPlugin);

zoomMax = 0
function qMatrix(height) {
  return {
    "C1": {"C1": -100000.0*height, "C2": 100000.0*height, "C3": 0, "O": 0},
    "C2": {"C1": 50, "C2": -64, "C3": 4, "O": 10},
    "C3": {"C1": 0, "C2": 0.02, "C3": -0.02, "O": 0},
    "O": {"C1": 0, "C2": 0.5, "C3": 0.0, "O": -0.5},
  }
}
function transformMeanData(data){
  let transformedData = data.map((x, i) => ({x: i * globalTimeStep, y: x}))
  //let newData = []
  //newData.push(transformedData[0])
  //console.log(transformedData)
  for (let i = 1; i < data.length - 1; i++){
    if (data[i] == data[i - 1] && data[i] == data[i + 1]){
      //newData.push(transformedData[i])
      transformedData[i].y = null
    }
  }
  //newData.push(transformedData[transformedData.length - 1])
  return transformedData.filter(x => x.y != null)
}
function drawTrace(data, elementID, timeStep, title, metadata){
  globalTimeStep = timeStep
  let newData = transformMeanData(data)
  //console.log(newData)
  return new Chart(
    document.getElementById(elementID),
    {
      type: 'line',
      data: {
        //labels: [...Array(data.length).keys()].map(x => (x * timeStep).toFixed(1)),
        datasets: [
          {
            type: 'line',
            label: "Current",
            data: newData,
            pointRadius: 0,
            borderWidth: 1,
            borderColor: 'rgb(125, 99, 233)',
            indexAxis: 'x'
          }
        ]
      },
      options: {
        cubicInterpolationMode: 'monotone',
        animation: false,
        parsing: false,
        plugins: {
            title: {
                display: true,
                text: title
            },
            legend: {
                display: false
            },
            //decimation: {
            //  enabled: true,
            //  algorithm: 'lttb',
            //  samples: 50,
            //  threshold: 1,
            //},
        },
        scales: {
          y: {
            title: {
              display: true,
              text: 'Current (pA)'
            },
            ticks: {
              callback: function(value, index, ticks) {
                return `${value.toFixed(2)}`
              }
            }
          },
          x: {
            type: 'linear',
            max: metadata.maxTime,
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
function zoomOptions(){
  return {
    pan: {
      enabled: true,
      mode: 'y'
    },
    limits: {
      y: {min:0, max: zoomMax, minRange: 2.1}
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
  }
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
    type: 'line',
    data: data.map((x, i) => ({x: i * globalTimeStep, y: x + (index* 1.5) + 1})),
    //data: data.map(x => x),
    pointRadius: 0,
    borderColor: colors[index % colors.length],
    borderWidth: 1
    //yAxisID: `y${index}`,
  }
}
function drawTraces(data, elementID, timeStep, title, metadata){
  zoomMax = data.length * 1.5
  globalTimeStep = timeStep
  return new Chart(
    document.getElementById(elementID),
    {
      type: 'line',
      data: {
        //labels: [...Array(data[0].length).keys()].map(x => (x * timeStep).toFixed(1)),
        datasets: data.map(traceDataTransform)
      },
      options: {
        animation: false,
        events: [],
        plugins: {
            title: {
                display: true,
                text: title
            },
            legend: {
                display: false
            },
            zoom: zoomOptions(),
        },
        scales: {
          y: {
            display: true,
            min: 0,
            max: zoomMax,
            position: 'left',
            title: {
              display: true,
              text: 'Current (pA)'
            },
            ticks: {
              stepSize: 0.5,
              callback: function(value, index, ticks) {
                if (value % 1.5 > 1) {
                  return ""
                }
                return `${((value % 1.5) - 1).toFixed(2)}`
              }
            }
            //stacked: true,
          },
          //y2: {
          //  display: true,
          //  min: 0,
          //  ticks: {
          //    display: false,
          //    stepsSize: 1.5,
          //    //callback: function(value, index, ticks) {
          //    //  if (value % 1.5 == 0) {
          //    //    return " "
          //    //  }
          //    //  return ""
          //    //}
          //  },
          //  grid : {
          //    lineWidth: 2,
          //    color: 'rgba(0, 0, 0, 0.5)',
          //  },
          //  position: 'right'
          //},
          x: {
            type: 'linear',
            max: metadata.maxTime,
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
function modelPlotTransform(data, metadata){
  let resultData = []
  console.log(data)
  for (let i = 0; i < data.length; i++){
    let modelValue = (metadata.modelSingleCurrent * data[i].x) - ((1/metadata.modelChannelAmount) * (data[i].x  * data[i].x))
    resultData.push({x: data[i].x, y: modelValue})
  }
  return resultData.sort((a, b) => a.x - b.x)
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
      data: modelPlotTransform(dataset, metadata),
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
        animation: false,
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
            min: 0, 
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
  chart.data.datasets[1].data = modelPlotTransform(data, metadata)
  chart.data.datasets[1].borderWidth = modelVisibility ? 2 : 0
  //console.log(chart.data.datasets[1].data)
  //chart.options.plugins.subtitle.text = `ensemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
function updateTrace(chart, data, timeStep, metadata){
  globalTimeStep = timeStep
  chart.data.datasets[0].data = transformMeanData(data)
  chart.options.scales.x.max = metadata.maxTime
  //chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}
function updateTraces(chart, data, timeStep, metadata){
  //data = data.slice(0, 5)
  globalTimeStep = timeStep
  zoomMax = data.length * 1.5
  chart.options.plugins.zoom = zoomOptions()
  chart.options.scales.y.max = zoomMax
  chart.data.datasets = data.map(traceDataTransform)
  chart.options.scales.x.max = metadata.maxTime
  //chart.data.labels = [...Array(data[0].length).keys()].map(x => (x * timeStep).toFixed(1))
  //chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
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
    conductance: 8,
    clist: createClist(8),
    initalState: "C1",
    timeStep: 0.05,
    singlechannelNoise: false,
    modelVisibility: false,
    randomSeed: 0,
    modelSingleCurrent: -0.5,
    modelChannelAmount: 1,
    modelDataPoints: 50,
  }
}
function createClist(conductance){
  return {
    "C1": 0,
    "C2": 0,
    "C3": 0,
    "O": conductance
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
    modelSingleCurrent: "updateGraphs",
    modelChannelAmount: "updateGraphs",
    conductance: "updateGraphs",
    conductanceNum: "updateGraphs",
  }
}
function getMessage(metadata){
  return {
    ensembleSize: metadata.ensembleSize,
    qflatpulse: metadata.qflatpulse,
    qPause: metadata.qPause,
    conductance: metadata.conductance,
    clist: createClist(metadata.conductance),
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
    modelSingleCurrent: metadata.modelSingleCurrent,
    modelChannelAmount: metadata.modelChannelAmount,
  }
}
function modelToString(metadata){
  let modelString = `Model Equation: <br> $$\\sigma^2 = ${metadata.modelSingleCurrent}I - \\frac{1}{${metadata.modelChannelAmount}}I^2$$`
  return modelString
}
function updateModelParams(update){
  if (update) {
    document.getElementById("modelSingleCurrentDiv").style = "display: flex"
    document.getElementById("modelChannelAmountDiv").style = "display: flex"
    document.getElementById("modelParamsDiv").style = "display: flex"
  }
  else {
    document.getElementById("modelSingleCurrentDiv").style = "display: none"
    document.getElementById("modelChannelAmountDiv").style = "display: none"
    document.getElementById("modelParamsDiv").style = "display: none"
  }
}
function defaultMethods(){
  return {
    drawGraphs() {
      worker.postMessage(getMessage(this))
      worker.onmessage = (e) => {
        window.singletraceGraph = drawTraces(e.data.singletraces, "singletraces", e.data.timeStep, "Single Trace Sweeps", e.data)
        //window.singletraceGraph = drawTrace(e.data.singletraces[0], "singletraces", e.data.timeStep, "Single Trace Sweeps", e.data)
        window.meantraceGraph = drawTrace(e.data.meantrace, "meantrace", e.data.timeStep, "Sum Trace", e.data)
        //window.CVmodel = CVfit(e.data.CVdata)
        window.CVgraph = drawScatter("CV", e.data.CVdata, window.CVmodel, "Variance Vs. Mean", e.data, this.modelVisibility)
        document.getElementById("stderr").innerHTML = "\\(" + e.data.stderror.toFixed(4) + "\\)"
        updateModelParams(this.modelVisibility)
        document.getElementById("modelParams").innerHTML = modelToString(e.data)
        MathJax.typeset()
      }
    },
    updateGraphs() {
      worker.postMessage(getMessage(this))
      worker.onmessage = (e) => {
        //window.CVmodel = CVfit(e.data.CVdata)
        updateTraces(window.singletraceGraph, e.data.singletraces, e.data.timeStep, e.data)
        updateTrace(window.meantraceGraph, e.data.meantrace, e.data.timeStep, e.data)
        updateScatter(window.CVgraph, e.data.CVdata, window.CVmodel, e.data, this.modelVisibility)
        updateModelParams(this.modelVisibility)
        document.getElementById("stderr").innerHTML = "\\(" + e.data.stderror.toFixed(4) + "\\)"
        document.getElementById("modelParams").innerHTML = modelToString(e.data)
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