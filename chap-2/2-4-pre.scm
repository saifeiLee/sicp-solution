; 注意：这里cons返回的是一个过程

(define (cons x y)
    (define (dispatch m)
        (cond ((= m 0) x)
            ((= m 1) y)
            (else (error "Argument not 0 or 1 -- CONS" m))))
    dispatch)

(define (car z)
    (z 0))

(define (cdr z)
    (z 1))

(define test (cons 1 2))
(display (car test))
(display (cdr test))
