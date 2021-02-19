(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define nil '())

(define (count-leaves t)
    (accumulate + 0
        (map (lambda (item)
            (if (pair? item)
                (count-leaves item)
                1))
            t)))

(define test-tree (list 1 (list 2 (list 3))))
(define res (count-leaves test-tree))
(display res)
