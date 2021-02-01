(define (for-each proc items)
    (if (null? items)
        items
        (begin
            (proc (car items))
            (for-each proc (cdr items))
        )))

(define (for-each-2 proc items)
    (cond ((null? items) #t)
        (else 
            (proc (car items))
            (for-each proc (cdr items)))))
(define items (list 1 2 3))
(for-each-2 display items)
