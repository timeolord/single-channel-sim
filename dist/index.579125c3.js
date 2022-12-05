//import { Chart } from 'chart.js/auto'
//Random number generation with the same behaviour as the original paper
class Random {
    constructor(){
        this.jSeed = 536870911;
        this.kSeed = 8388607;
    }
    random() {
        var k = Math.floor(this.jSeed / 53668);
        this.jSeed = 40014 * (this.jSeed - k * 53668) - k * 12211;
        if (this.jSeed < 0) this.jSeed += 2147483563;
        k = Math.floor(this.kSeed / 52774);
        this.kSeed = 40692 * (this.kSeed - k * 52774) - k * 3791;
        if (this.kSeed < 0) this.kSeed += 2147483399;
        var Z = this.jSeed - this.kSeed;
        if (Z < 1) Z += 2147483562;
        return parseFloat(4.65661305739177e-10 * parseFloat(Z));
    }
}
r = new Random();
function range(start, end) {
    const length = end - start;
    return Array.from({
        length
    }, (_, i)=>start + i);
}
function drop(array, n) {
    if (n == 0) return array;
    if (n > 0) {
        for(let i = 0; i < n; i++)array.shift();
        return array;
    } else {
        for(let i1 = 0; i1 > n; i1--)array.pop();
        return array;
    }
}
function windows(a, sz, skip) {
    return a.map((_, i, ary)=>ary.slice(i, i + sz)).slice(0, -sz + skip);
}
function dot(a, b) {
    let t1 = a.map((x, i)=>a[i] * b[i]);
    let t2 = t1.reduce((a, b)=>a + b);
    return t2;
}
function singletrace(qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, timeStep) {
    let timeIncrement = 0;
    let time = 0;
    let state = initalState;
    let minimumPosition = "";
    let decayTimes = new Object();
    let current = new Array(Math.floor(maxTime / timeStep));
    current[timeIncrement] = -u * conductivityList[state]; /* current at t = 0 */ 
    function singletrace_aux(timeLimit, q) {
        while(time < timeLimit){
            /* calculate decay times into prospective new states */ for(let newState in conductivityList)if (q[state][newState] > 0.) decayTimes[newState] = -Math.log(r.random()) / q[state][newState];
            else /* no decay in this direction */ decayTimes[newState] = maxTime + 1.;
            /* find minimum decay time and resp. new state */ let minimumTime = maxTime + 2;
            for(let newState1 in conductivityList)if (decayTimes[newState1] < minimumTime) {
                minimumTime = decayTimes[newState1];
                minimumPosition = newState1;
            }
            /* check if transmitter pulse duration is exceeded */ if (time + minimumTime < timeLimit) {
                /* write to current[] and update state and time */ for(let timeIncrementSojourn = timeIncrement + 1; timeIncrementSojourn <= Math.floor((time + minimumTime) / timeStep); timeIncrementSojourn++)current[timeIncrementSojourn] = -u * conductivityList[state];
                state = minimumPosition; /* new state */ 
                time = time + minimumTime; /* new time */ 
                timeIncrement = Math.floor(time / timeStep);
            } else {
                /* clip sojourn at the end of the transmitter pulse */ /* write to current[] and update time */ for(let timeIncrementSojourn1 = timeIncrement + 1; timeIncrementSojourn1 <= Math.floor(timeLimit / timeStep); timeIncrementSojourn1++)current[timeIncrementSojourn1] = -u * conductivityList[state];
                /* keep old state */ time = timeLimit; /* new time */ 
                timeIncrement = Math.floor(time / timeStep);
            }
        } /* while */ 
    }
    /* transmitter pulse */ singletrace_aux(duration, qflatpulse);
    /* relaxation after transmitter pulse */ singletrace_aux(maxTime, qflatpause);
    return current;
}
function tracetable(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep) {
    return range(0, n).map(()=>singletrace(qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, timeStep));
}
function meancurrent(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep) {
    function addvector(a, b) {
        return a.map((x, i)=>x + b[i]);
    }
    let tracetableResult = tracetable(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep);
    return tracetableResult.reduce((a, b)=>addvector(a, b)).map((x)=>x / n);
}
function filtertest(ensembleSize, qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, samplingFrequency, cutoffFrequency) {
    let timeStep = 1 / samplingFrequency;
    let sigma = 0.1325 / (cutoffFrequency / samplingFrequency);
    let filterN = Math.round(4 * sigma);
    let filterA = range(-filterN, filterN + 1).map((x)=>Math.exp(-x * x / (2 * sigma * sigma)));
    filterA = filterA.map((x)=>x / filterA.reduce((a, b)=>a + b));
    let sampledCurrent = new Array(filterN).fill(0).concat(meancurrent(qflatpulse, qflatpause, conductivityList, initalState, duration, ensembleSize, u, maxTime + filterN * timeStep, timeStep).map((x)=>x * ensembleSize));
    let unfilteredCurrent = drop(drop([
        ...sampledCurrent
    ], filterN), -filterN);
    let filteredCurrent = windows([
        ...sampledCurrent
    ], 1 + 2 * filterN, 1).map((x)=>dot(x, filterA));
    return {
        "unfilteredCurrent": unfilteredCurrent,
        "filteredCurrent": filteredCurrent,
        "timeStep": timeStep
    };
}
function peakEPSCs(ensembleSize, qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, samplingFrequency, cutoffFrequency) {
    let peaks = range(0, n).map(()=>filtertest(ensembleSize, qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, samplingFrequency, cutoffFrequency).filteredCurrent.reduce((a, b)=>Math.min(a, b)));
    let peakFrequencies = new Array(Math.round(-Math.min(...peaks) * 1.5)).fill(0);
    peaks.forEach((x)=>peakFrequencies[-Math.round(x)]++);
    return peakFrequencies.map((x)=>x / peakFrequencies.reduce((a, b)=>a + b));
}
function qMatrix(height) {
    return {
        "C1": {
            "C1": -100000 * height,
            "C2": 100000.0 * height,
            "C3": 0,
            "O": 0
        },
        "C2": {
            "C1": 50,
            "C2": -64,
            "C3": 4,
            "O": 10
        },
        "C3": {
            "C1": 0,
            "C2": 0.02,
            "C3": -0.02,
            "O": 0
        },
        "O": {
            "C1": 0,
            "C2": 0.5,
            "C3": 0.0,
            "O": -0.5
        }
    };
}
function drawTrace(data, elementID, timeStep, title, metadata) {
    return new Chart(document.getElementById(elementID), {
        type: "line",
        data: {
            labels: [
                ...Array(data.length).keys()
            ].map((x)=>(x * timeStep).toFixed(1)),
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
                    text: `emsemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms, sampling frequency = ${metadata.samplingFrequency} kHz, cutoff frequency = ${metadata.cutoffFrequency} kHz`,
                    padding: {
                        bottom: 20
                    }
                }
            },
            scales: {
                y: {
                    title: {
                        display: true,
                        text: "Current (pA)"
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: "Time (ms)"
                    }
                }
            }
        }
    });
}
function updateTrace(chart, data, timeStep, metadata) {
    chart.data.datasets[0].data = data;
    chart.data.labels = [
        ...Array(data.length).keys()
    ].map((x)=>(x * timeStep).toFixed(1));
    chart.options.plugins.subtitle.text = `emsemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms, sampling frequency = ${metadata.samplingFrequency} kHz, cutoff frequency = ${metadata.cutoffFrequency} kHz`;
    chart.update();
}
function drawHistrogram(data, elementID, metadata) {
    return new Chart(document.getElementById(elementID), {
        type: "bar",
        data: {
            labels: [
                ...Array(data.length).keys()
            ],
            datasets: [
                {
                    label: `Peak EPSC Frequency`,
                    data: data
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: `Peak EPSC Amplitiude Distribution`
                },
                subtitle: {
                    display: true,
                    text: `emsemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms, sampling frequency = ${metadata.samplingFrequency} kHz, cutoff frequency = ${metadata.cutoffFrequency} kHz`,
                    padding: {
                        bottom: 20
                    }
                },
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    title: {
                        display: true,
                        text: "Frequency"
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: "Current (pA)"
                    }
                }
            }
        }
    });
}
function updateHistogram(chart, data, metadata) {
    chart.data.datasets[0].data = data;
    chart.data.labels = [
        ...Array(data.length).keys()
    ];
    chart.options.plugins.subtitle.text = `emsemble size = ${metadata.ensembleSize}, n = ${metadata.n}, duration = ${metadata.duration} ms, u = ${metadata.u}, max time = ${metadata.maxTime} ms, sampling frequency = ${metadata.samplingFrequency} kHz, cutoff frequency = ${metadata.cutoffFrequency} kHz`;
    chart.update();
}
function defaultMetadata() {
    return {
        n: 200,
        ensembleSize: 100,
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
    };
}
function defaultWatch() {
    return {
        n: "updateGraphs",
        ensembleSize: "updateGraphs",
        samplingFrequency: "updateGraphs",
        cutoffFrequency: "updateGraphs",
        duration: "updateGraphs",
        u: "updateGraphs",
        maxTime: "updateGraphs",
        height: "updateGraphs",
        clist: "updateGraphs",
        initalState: "updateGraphs",
        timeStep: "updateGraphs"
    };
}
function defaultMethods() {
    return {
        drawGraphs () {
            let data = peakEPSCs(this.ensembleSize, this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.n, this.u, this.maxTime, this.samplingFrequency, this.cutoffFrequency);
            window.histogram = drawHistrogram(data, "histogram", this);
            data = singletrace(this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.u, this.maxTime, this.timeStep);
            window.singlegraph = drawTrace(data, "singletrace", this.timeStep, "Single Trace", this);
            data = meancurrent(this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.n, this.u, this.maxTime, this.timeStep);
            window.meangraph = drawTrace(data, "meancurrent", this.timeStep, "Mean Current", this);
            data = filtertest(this.ensembleSize, this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.u, this.maxTime, this.samplingFrequency, this.cutoffFrequency);
            window.filtered = drawTrace(data.filteredCurrent, "filtered", data.timeStep, "Filtered Mean Current", this);
            window.unfiltered = drawTrace(data.unfilteredCurrent, "unfiltered", data.timeStep, "Unfiltered Mean Current", this);
        },
        updateGraphs () {
            let data = peakEPSCs(this.ensembleSize, this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.n, this.u, this.maxTime, this.samplingFrequency, this.cutoffFrequency);
            updateHistogram(histogram, data, this);
            data = singletrace(this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.u, this.maxTime, this.timeStep);
            updateTrace(singlegraph, data, this.timeStep, this);
            data = meancurrent(this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.n, this.u, this.maxTime, this.timeStep);
            updateTrace(meangraph, data, this.timeStep, this);
            data = filtertest(this.ensembleSize, this.qflatpulse, this.qPause, this.clist, this.initalState, this.duration, this.u, this.maxTime, this.samplingFrequency, this.cutoffFrequency);
            updateTrace(filtered, data.filteredCurrent, data.timeStep, this);
            updateTrace(unfiltered, data.unfilteredCurrent, data.timeStep, this);
        }
    };
}
function setSliderCallbacks(metadata) {
    let sliders = document.querySelectorAll("input[type='range']");
    sliders.forEach((slider)=>{
        slider.addEventListener("input", (event)=>{
            let id = event.target.id;
            let value = event.target.value;
            metadata[id] = value;
        });
    });
} //(async function() {
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

//# sourceMappingURL=index.579125c3.js.map
