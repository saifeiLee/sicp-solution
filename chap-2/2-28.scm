(define (fringe tree)
    (define (iter items accu)
        (if (null? items)
            accu
            (let ((head (car items))
                    (tail (cdr items)))
                (if (list? head)
                    (iter tail (append accu (fringe head)))
                    (iter tail (append accu (list head)))))))
    (iter tree '()))

(define x (list (list 1 2) (list 3 4)))
(display (fringe x))
