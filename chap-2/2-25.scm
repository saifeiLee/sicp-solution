(define items (list 1 3 (list 5 7) 9))
(display items)
(newline)
(display (cadr (caddr items)))
; (display (car (caddr items)))
(newline)
(define items-2 (list (list 7)))
(display (car (car items-2)))
(newline)

(define items-3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display (cadadr (cadadr (cadadr items-3))))

; solution 2
(newline)
(define (compose f g)
    (lambda (x) (f (g x))))
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

(define (pick-items items)
    (define (pick items)
        (car (cdr items)))
    (display ((repeated pick 6) items)))
(pick-items items-3)
