(define nil '())

(define (reverse z)
    (define (reverse-iter items accu)
        (if (null? items)
            accu
            (reverse-iter (cdr items) (cons (car items) accu))))
    (reverse-iter z nil))

(define items (list 1 2 3 4))
(display items)
(newline)
(display (reverse items))
