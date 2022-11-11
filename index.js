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

let r = new Random()

console.log(r.random())