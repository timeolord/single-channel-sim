//Random number generation with the same behaviour as the original paper
class Random {
    constructor(){
      this.jSeed = 536870911
      this.kSeed = 8388607
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
r = new Random()
  
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
function singletrace(qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, timeStep){
    let timeIncrement = 0
    let time = 0
    let state = initalState
    let minimumPosition = ""
    let decayTimes = new Object()
    let current = new Array(Math.floor(maxTime / timeStep))
      current[timeIncrement] = -u*conductivityList[state]; /* current at t = 0 */
  
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
               timeIncrementSojourn++)
            current[timeIncrementSojourn] = -u*conductivityList[state];
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
            current[timeIncrementSojourn] = -u*conductivityList[state];
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
function tracetable(qflatpulse, qflatpause, conductivityList, initalState, duration, n, u, maxTime, timeStep){
    return range(0, n).map(() => singletrace(qflatpulse, qflatpause, conductivityList, initalState, duration, u, maxTime, timeStep))
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

onmessage = (e) => {
    e.data.clist = JSON.parse(e.data.clist)
    e.data.meancurrent = meancurrent(e.data.qflatpulse, e.data.qPause, e.data.clist, e.data.initalState, e.data.duration, e.data.n, e.data.u, e.data.maxTime, e.data.timeStep)
    e.data.peakEPSCs = peakEPSCs(e.data.ensembleSize, e.data.qflatpulse, e.data.qPause, e.data.clist, e.data.initalState, e.data.duration, e.data.n, e.data.u, e.data.maxTime, e.data.samplingFrequency, e.data.cutoffFrequency)
    postMessage(e.data)
  }
  