

(define (same-parity x . items)
    (define (find-same-parity items predict accu)
        (if (null? items)
            accu
            (if (predict (car items))
                (find-same-parity (cdr items) predict (append (list (car items)) accu))
                (find-same-parity (cdr items) predict accu))))
    (if (odd? x)
        (find-same-parity items odd? '())
        (find-same-parity items even? '())))

(define test (same-parity 1 2 3 4 5))
(display test)
