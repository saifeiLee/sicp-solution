; 求和高阶函数的递归写法
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ a result))))
    (iter a 0))

(define (fx x) x)
(define (inc x) (+ x 1))
(define result (sum fx 1 inc 3))

(display result)
; (display (sum fx 1 inc 3))

