; 将求和/求乘积的高阶函数再做一层抽象


(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner 
            (term a)
            (accumulate combiner null-value term (next a) next b))))

(define (add x y) (+ x y))
(define (fx x) x)
(define (inc x) (+ x 1))

(define test-sum (add 1 2))
; (display test-sum)
; 使用accumulate实现sum
; sum(3)
(define sum_3 (accumulate add 0 fx 1 inc 3))
(display sum_3)
(display "\n")

(define sum_4 (accumulate add 0 fx 1 inc 4))
(display sum_4)
(display "\n")

(define (multiply x y) (* x y))
; 实现product
(define product_3 (accumulate multiply 1 fx 1 inc 3))
; product_3 === 6
(if (= product_3 6)
    (display "product_3 === 6\n")
    (display "product error.\n"))


; 递归转为线性迭代
(define (accumulate-iter combiner null-value term a next b)
    (define (iter acc a)
        (if (> a b)
            acc
            (iter (combiner (term a) acc) (next a))))
    (iter null-value a))
(define iter_sum_3 (accumulate-iter add 0 fx 1 inc 3))
(display iter_sum_3)
(display "\n")
