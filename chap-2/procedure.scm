(define (make-rat n d) (cons n d))
(define (number x) (car d))
(define (denom x) cdr x)

(make-rat 1 2)

(define (memq item x)
    (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
