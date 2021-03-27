(define (print item)
    (display item)
    (newline))

(print (car ''abc))

; (car ``abc)等于(car (quote (quote abc))) => quote
