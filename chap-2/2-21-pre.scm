(define nil '())
(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items)) (map proc (cdr items)))))

(define test (map abs (list -10 2.5)))
(display test)
