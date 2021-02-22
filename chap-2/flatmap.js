var arr1 = [1, 2, 3, 4];

const test3 =arr1.map((x) => [x * 2]);
// [[2], [4], [6], [8]]

const test2 = arr1.flatMap((x) => [x * 2]);
// [2, 4, 6, 8]

// only one level is flattened
const test1 = arr1.flatMap((x) => [[x * 2]]);
// [[2], [4], [6], [8]]
console.log(test3);
console.log(test2);
console.log(test1);

console.log(arr1.flatMap(x => x * 2));
