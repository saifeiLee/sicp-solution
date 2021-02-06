(define x (list 1 2 3))
(define y (list 4 5 6))

(define test_1 (append x y))    ; (1 2 3 4 5 6)
(define test_2 (cons x y))      ; ((1 2 3) (4 5 6))
(define test_3 (list x y))      ;((1 2 3) (4 5 6))

(display (cdr test_3))
