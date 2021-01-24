(define (cons x y)
    (lambda (n) (n x y)))

(define (car z)
    (z (lambda (x y) x)))

(define (cdr z)
    (z (lambda (x y) y)))

(define test (cons 1 2))
(define test_car (car test))
(define test_cdr (cdr test))
(display test_car)
(display test_cdr)
