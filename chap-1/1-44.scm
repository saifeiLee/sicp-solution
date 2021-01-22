(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        f
        (repeated (compose f f) (- n 1))))

(define dx 0.00001)

(define (average x1 x2 x3)
    (/ (+ x1 x2 x3) 3))
(define (smooth f)
    (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))


(define (nSmooth smooth n)
    (repeated smmoth n))
