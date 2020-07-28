const sum = (term, a, next, b) => {
  if (a > b) return 0;
  return term(a) + sum(term, next(a), next, b)
}


const cube = (x) => x * x * x;

const inc = (n) => n + 1;

const sum_cubes = (a, b) => {
  return sum(cube, a, inc, b);
}

// const res = sum_cubes(1, 10);
// console.log('sum_cubes(1, 10)', res);

const integral = (f, a, b, dx) => {
  const add_dx = (x) => x + dx;
  return sum(f, (a + dx / 2.0), add_dx, b) * dx;
}

const res = integral(cube, 0, 1, 0.01)
console.log('res:', res);
