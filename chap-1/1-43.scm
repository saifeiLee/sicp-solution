(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        f
        (repeated (compose f f) (- n 1))))

(define (square x) (* x x))

(define test ((repeated square 2) 5))
(display test)
(newline)
