function enumerateInterval(low, high) {
  if (low > high) {
    return []
  } else {
    return [].concat([low], enumerateInterval(low + 1, high))
  }
}
// test
const res = enumerateInterval(1, 3);
console.log(res);

function flatmap() {
  
}
