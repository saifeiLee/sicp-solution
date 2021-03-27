(define (print item)
    (display item)
    (newline))
(print (list `a `b `c))

(print (list (list `george)))
(print (cdr `((x1 x2) (y1 y2))))
(print (cadr `((x1 x2) (y1 y2))))

