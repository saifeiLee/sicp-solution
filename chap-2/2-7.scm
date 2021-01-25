(define (upper-bound z)
    (max (car z)
        (cdr z)))

(define (lower-bound z)
    (min (car z)
        (cdr z)))
