(define (double f)
    (lambda (x) (f (f x))))
(define (inc x) (+ x 1))

; (define test ((double inc) 1))
; (display test)

(let ((res (((double (double double)) inc ) 5)))
    (display res))
; 21
