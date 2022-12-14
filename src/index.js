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
            pointRadius: 0
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
function updateTrace(chart, data, timeStep, metadata){
  chart.data.datasets[0].data = data
  chart.data.labels = [...Array(data.length).keys()].map(x => (x * timeStep).toFixed(1))
  chart.options.plugins.subtitle.text = `n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms`
  chart.update()
}

function defaultMetadata(){
  return {
    n: 20,
    //ensembleSize: 100,
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
    timeStep: 0.02
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
    timeStep: "updateGraphs"
  }
}
function defaultMethods(){
  return {
    drawGraphs() {
      let message = {
        ensembleSize: this.ensembleSize,
        qflatpulse: this.qflatpulse,
        qPause: this.qPause,
        clist: JSON.stringify(this.clist),
        initalState: this.initalState,
        duration: this.duration,
        n: this.n,
        u: this.u,
        timeStep: this.timeStep,
        maxTime: this.maxTime,
        samplingFrequency: this.samplingFrequency,
        cutoffFrequency: this.cutoffFrequency
      }
      worker.postMessage(message)
      worker.onmessage = (e) => {
        window.meangraph = drawTrace(e.data.meancurrent, "meancurrent", e.data.timeStep, "Mean Current", e.data)
      }
    },
    updateGraphs() {

      let message = {
        ensembleSize: this.ensembleSize,
        qflatpulse: this.qflatpulse,
        qPause: this.qPause,
        clist: JSON.stringify(this.clist),
        initalState: this.initalState,
        duration: this.duration,
        n: this.n,
        u: this.u,
        timeStep: this.timeStep,
        maxTime: this.maxTime,
        samplingFrequency: this.samplingFrequency,
        cutoffFrequency: this.cutoffFrequency
      }
      worker.postMessage(message)
      worker.onmessage = (e) => {
        console.log(e)
        updateTrace(window.meangraph, e.data.meancurrent, e.data.timeStep, e.data)
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
  },
  computed: {
    qflatpulse() {
      return qMatrix(this.height)
    },
    qPause() {
      return qMatrix(0)
    }
  }
}).mount('#graphs')
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