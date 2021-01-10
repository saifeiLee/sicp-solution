function cube(x) {
  return x * x * x;
}

function sum_HOF(a, b, next, term) {
  let res;
  if (a > b) {
    res = 0;
  } else {
    res = term(a) + sum_HOF(next(a), b, next, term);
  }
  return res;
}

function simpson(f, a, b, n) {
  // 是否偶数
  const isEven = (num) => num % 2 === 0;

  const h = (b - a) / n;

  const yk = (k) => f(a + (k * h));

  const getCoefficient = (k) => {
    if (k === 0 || k === n){ 
      return 1;
    } else if (isEven(k)) {
      return 2;
    } else {
      return 4;
    }
  }
  const term = k => getCoefficient(k) * yk(k);

  const inc = x => x + 1;
  return (h * (sum_HOF(0, n, inc, term))) / 3;
}

console.log('cube 1 100')
const fx = x => x 
const res_simpson = simpson(fx, 0, 1, 1000);
console.log('res_simpson', res_simpson)
