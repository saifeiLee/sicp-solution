function filterAccumulate(combiner, nullValue, term, a, next, b, filter) {
  if (a > b) {
    return nullValue;
  } else if (filter(a)) {
    // console.log("pass filter:", a);
    return combiner(
      term(a),
      filterAccumulate(combiner, nullValue, term, next(a), next, b, filter)
    );
  } else {
    return combiner(
      nullValue,
      filterAccumulate(combiner, nullValue, term, next(a), next, b, filter)
    );
  }
}

function combinerSum(a, b) {
  return a + b;
}

function combinerMultiply(a, b) {
  return a * b;
}

function even(n) {
  return n % 2 === 0;
}
/**
 * 求base的exp次方对m的余数
 * @param {number} base 基数
 * @param {number} exp 指数
 * @param {number} m 模
 */
function expMod(base, exp, m) {
  if (exp === 0) return 1;
  if (even(exp)) {
    return Math.pow(expMod(base, exp / 2, m), 2) % m;
  } else {
    return Math.pow(base * expMod(base, exp - 1, m), 2) % m;
  }
}

function getRandomInt(max) {
  const res = Math.floor(Math.random() * Math.floor(max));
  return res === 0 ? res + 1 : res;
}

function isPrime(n) {
  const tryIt = (a) => {
    if (n === 4) {
      console.log('expMod result: ', expMod(a, n, n));
      console.log('a:', a);
    }
    return expMod(a, n, n) === a;
  };
  if (n === 0 || n === 1) return true;
  return tryIt(getRandomInt(n) + 1);
}
const square = (x) => x * x;

const inc = (x) => x + 1;
// test code
const sumSquarePrime = (a, b) =>
  filterAccumulate(combinerSum, 0, square, a, inc, b, isPrime);

const res = sumSquarePrime(1, 5);
console.log(res);
const isPrime4 = isPrime(4);
// console.log("isPrime4:", isPrime4);
