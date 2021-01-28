(define (last-pair z)
    (if (null? (cdr z))
        z
        (last-pair (cdr z))))

(display (last-pair (list 1 3 5 6)))
