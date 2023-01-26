//Random number generation with the same behaviour as the original paper

class Random {
    constructor(seed){
      this.jSeed = 536870911 + seed
      this.kSeed = 8388607 + seed
    }
    random(){
      var k = Math.floor(this.jSeed / 53668)
      this.jSeed = 40014 * (this.jSeed - k*53668) - k * 12211
  
      if(this.jSeed < 0){
        this.jSeed += 2147483563;
      }
  
      k = Math.floor(this.kSeed / 52774);
        this.kSeed = 40692 * (this.kSeed - k*52774) - k * 3791;
  
      if(this.kSeed < 0){
        this.kSeed += 2147483399;
      }
  
      var Z = this.jSeed - this.kSeed;
  
        if(Z < 1){
        Z += 2147483562;
      } 
  
        return parseFloat(4.65661305739177e-10 * parseFloat(Z));
    }
  }

  
function range(start, end){
    const length = end - start;
    return Array.from({ length }, (_, i) => start + i);
}
function drop(array, n){
    if (n == 0){
      return array
    }
    if (n > 0) {
      for (let i = 0; i < n; i++){
        array.shift()
      }
      return array
    }
    else {
      for (let i = 0; i > n; i--){
        array.pop()
      }
      return array
    }
}
function windows(a, sz, skip) {
    return a.map((_, i, ary) => ary.slice(i, i + sz)).slice(0, -sz + skip);
}
function dot(a, b){
    let t1 = a.map((x, i) => a[i] * b[i])
    let t2 = t1.reduce((a, b) => a + b)
    return t2;
}
function generateNoise(noise){
    return r.random() * noise;
}
function singletrace(qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, timeStep, noise){
    let timeIncrement = 0
    let time = 0
    let state = initalState
    let minimumPosition = ""
    let decayTimes = new Object()
    let current = new Array(Math.floor(maxTime / timeStep))
    current[timeIncrement] = -u*conductivityList[state] + generateNoise(noise); /* current at t = 0 */
  
    function singletrace_aux(timeLimit, q) {
      while (time < timeLimit) {
        /* calculate decay times into prospective new states */
        for (let newState in conductivityList) {
          if (q[state][newState] > 0.)
            decayTimes[newState] = -Math.log(r.random()) / q[state][newState];
          else
            /* no decay in this direction */
            decayTimes[newState] = maxTime + 1.;
            /* tmax + 1. is infinity() for this purpose */
        }
        /* find minimum decay time and resp. new state */
        let minimumTime = maxTime + 2;
        for (let newState in conductivityList) {
          if (decayTimes[newState] < minimumTime) {
            minimumTime = decayTimes[newState];
            minimumPosition = newState;
          }
        }
        /* check if transmitter pulse duration is exceeded */
        if (time + minimumTime < timeLimit) {
          /* write to current[] and update state and time */
          for (let timeIncrementSojourn = timeIncrement + 1;
               timeIncrementSojourn <= Math.floor((time + minimumTime) / timeStep);
               timeIncrementSojourn++) {
                current[timeIncrementSojourn] = -u*conductivityList[state] + generateNoise(noise);
               }
          state = minimumPosition; /* new state */
          time = time + minimumTime; /* new time */
          timeIncrement = Math.floor(time / timeStep);
        }
        else {
          /* clip sojourn at the end of the transmitter pulse */
          /* write to current[] and update time */
          for (let timeIncrementSojourn = timeIncrement + 1;
               timeIncrementSojourn <= Math.floor(timeLimit / timeStep);
               timeIncrementSojourn++)
               {
                current[timeIncrementSojourn] = -u*conductivityList[state] + generateNoise(noise);
               }
          /* keep old state */
          time = timeLimit; /* new time */
          timeIncrement = Math.floor(time / timeStep);
        }
      } /* while */
    }
  
      /* transmitter pulse */
    singletrace_aux(duration, qflatpulse)
  
      /* relaxation after transmitter pulse */
    singletrace_aux(maxTime, qflatpause)
  
    return current
}
function tracetable(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep, noise){
    return range(0, n).map(() => singletrace(qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, timeStep, noise))
}
function meancurrent(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep){
    function addvector(a, b){
      return a.map((x, i) => x + b[i])
    }
    let tracetableResult = tracetable(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep)
    return tracetableResult.reduce((a, b) => addvector(a, b)).map(x => x / n)
}
function filtertest(ensembleSize, qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, samplingFrequency, cutoffFrequency){
    let timeStep = 1 / samplingFrequency
    let sigma = 0.1325 / (cutoffFrequency / samplingFrequency);
    let filterN = Math.round(4 * sigma)
    let filterA = range(-filterN, filterN + 1).map(x => Math.exp(-x*x / (2*sigma*sigma)))
    filterA = filterA.map(x => x / filterA.reduce((a, b) => a + b))
    let sampledCurrent = new Array(filterN).fill(0).concat(
        meancurrent(qflatpulse, qflatpause, conductivityList, initalState, duration, ensembleSize, u, maxTime + (filterN * timeStep), timeStep).map(x => x * ensembleSize))
    let unfilteredCurrent = drop(drop([...sampledCurrent], filterN), -filterN)
    let filteredCurrent = windows([...sampledCurrent], 1 + (2 * filterN), 1).map(x => dot(x, filterA))
    return {"unfilteredCurrent": unfilteredCurrent, "filteredCurrent": filteredCurrent, "timeStep": timeStep}
}
function peakEPSCs(ensembleSize, qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, samplingFrequency, cutoffFrequency){
    let peaks = range(0, n).map(() => filtertest(ensembleSize, qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, samplingFrequency, cutoffFrequency).filteredCurrent.reduce((a, b) => Math.min(a, b)))
    let peakFrequencies = new Array(Math.round(-Math.min(...peaks) * 1.5)).fill(0)
    peaks.forEach(x => peakFrequencies[-Math.round(x)]++)
    return peakFrequencies.map(x => x / peakFrequencies.reduce((a, b) => a + b))
}
function mean(array){
    return array.reduce((a, b) => a + b) / array.length
}
function variance(array){
    let m = mean(array)
    return mean(array.map(x => (x - m) * (x - m)))
}
/* function CVdata(maxN, ensembleSize, options){

    function aux(n, options) {
        return meancurrent(options.qflatpulse, options.qPause, options.clist, options.initalState, options.duration, n, options.u, options.maxTime, options.timeStep)
    }
    function roundAux(i){
        return JSON.stringify({x: i.x.toPrecision(3), y: i.y.toPrecision(3)})
    }
    
    let resultData = new Set()

    for (let ensemble = 0; ensemble < ensembleSize; ensemble++){
        let currents = range(5, maxN).map(x => aux(x, options))
        for (let i = 0; i < currents[0].length; i++){
            let current = []
            for (let j = 0; j < currents.length; j++){
                current.push(currents[j][i])
            }
            let meanCurrent = mean(current)
            let varianceCurrent = variance(current)
            resultData.add(roundAux({x: meanCurrent, y: varianceCurrent}))
        }
    }
    return resultData
} */

/* function CVdata(maxN, ensembleSize, windowSize, options){

    function aux(n, options) {
        return tracetable(options.qflatpulse, options.qPause, options.clist, options.initalState, options.duration, n, options.u, options.maxTime, options.timeStep, options.singlechannelNoise)
    }
    function roundAux(i){
        const decimals = 4
        return JSON.stringify({x: i.x.toFixed(decimals), y: i.y.toFixed(decimals)})
    }
    
    let resultData = new Set()

    for (let ensemble = 0; ensemble < ensembleSize; ensemble++){
        let currents = aux(maxN, options)
        for (let i = 0; i < currents[0].length; i++){
            let current = []
            for (let j = 0; j < currents.length; j++){
                current.push(mean(currents[j].slice(i, i+windowSize)))
            }
            let meanCurrent = mean(current)
            let varianceCurrent = variance(current)
            resultData.add(roundAux({x: meanCurrent, y: varianceCurrent}))
        }
    }
    return [...resultData].map(x => JSON.parse(x))
} */

function CVdata(maxN, ensembleSize, windowSize, options){
    const decimals = 3

    function aux(n, options) {
        return tracetable(options.qflatpulse, options.qPause, options.clist, options.initalState, options.duration, n, options.u, options.maxTime, options.timeStep, options.singlechannelNoise)
    }
    
    let resultData = []

    for (let ensemble = 0; ensemble < ensembleSize; ensemble++){
        let currents = aux(maxN, options)
        for (let i = 0; i < currents[0].length; i++){
            let current = []
            for (let j = 0; j < currents.length; j++){
                current.push(mean(currents[j].slice(i, i+windowSize)))
            }
            let meanCurrent = mean(current)
            let varianceCurrent = variance(current)
            if (resultData[meanCurrent.toFixed(decimals)] === undefined){
                resultData[meanCurrent.toFixed(decimals)] = varianceCurrent
            } else {
                const value = resultData[meanCurrent.toFixed(decimals)]
                resultData[meanCurrent.toFixed(decimals)] = (value + varianceCurrent) / 2
            }
        }
    }
    return Object.keys(resultData).map(x => ({x: x, y: resultData[x]}))
}


onmessage = (e) => {
    e.data.clist = JSON.parse(e.data.clist)
    r = new Random(e.data.randomSeed)
    e.data.singletraces = tracetable(e.data.qflatpulse, e.data.qPause, e.data.clist, e.data.initalState, e.data.duration, e.data.n, e.data.u, e.data.maxTime, e.data.timeStep, e.data.singlechannelNoise)
    e.data.CVdata = CVdata(e.data.n, e.data.ensembleSize, 5, e.data)
    postMessage(e.data)
  }
  