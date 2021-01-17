/**
 * 
 * @param {function} combiner 累积函数
 * @param {number} null_value 默认值
 * @param {function} term 应用在求值对象上，求出目标值
 * @param {*} a 所求范围的起始值
 * @param {*} next 求出下一轮运算的起始值
 * @param {*} b 所求范围的终止值
 */
function accumulate(combiner, null_value, term, a, next, b) {
  if (a > b) {
    return null_value;
  } else {
    return combiner(
      term(a),
      accumulate(combiner, null_value, term, next(a), next, b)
    );
  }
}
