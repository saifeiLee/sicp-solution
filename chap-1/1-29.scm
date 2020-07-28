; 前置过程

(define (sum-integers a b)
    (if (> a b)
        0
        (+ a (sum-integers (+ a 1) b))))

; (sum-integers 1 3)

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (cube x)
    (x * x * x))


(define (inc n) (+ n 1))

(define (sum-cubes a b)
    (sum cube a inc b))

(sum-cubes 1 5)

