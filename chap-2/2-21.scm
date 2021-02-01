(define nil '())

(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-2 items)
    (map square items))

(define items-1 (list 1 2 3))
(define test (square-list items-1))
(define test-2 (square-list-2 items-1))
(display test)
(display test-2)
