; 计算f在[a, b]各点的乘积
(define (product f a next b)
    (if (> a b)
        1
        (* (f a)
            (product f (next a) next b))))
; fx = x, [1, 3], result应该为6

(define (fx x) x)

(define (inc x) (+ x 1))

(define res (product fx 1 inc 3))

(display "\n")

(if (= res 6)
    (display "Test OK\n")
    (display "Test Fail\n"))

; Re-write factorial

(define (factorial n)
    (product fx 1 inc n))
(define fc3 (factorial 3))
(display fc3)
(display "\n")
(define fc4 (factorial 4))
(display fc4)
(display "\n")

; 计算求PI公式
(define (calcPI n)
    (define (term k)
        (if (odd? k)
            (/ (+ k 1) (+ k 2))
            (/ (+ k 2) (+ k 1))))
    (define (inc x) (+ x 1))
    (* 4 (product term 1 inc n)))
(define PI50 (calcPI 50))
(define PI100 (calcPI 100))
(display PI50)
(display "\n")
(display PI100)
(display "\n")

; 递归迭代转为线性迭代
(define (product-iter n)
    (define (iter result count maxCount)
        (if (> count maxCount)
            result
            (iter (* count result) (+ count 1) maxCount)))
    (iter 1 1 n))

(define res-iter (product-iter 3))

(display "\n")

(if (= res-iter 6)
    (display "Test OK\n")
    (display "Test Fail\n"))
