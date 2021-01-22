(define (compose f g)
    (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(define (square x) (* x x))
(define test ((compose square inc) 6))
(display test)
