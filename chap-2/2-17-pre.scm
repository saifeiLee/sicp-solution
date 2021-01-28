(define (list-ref l n)
    (if (= n 0)
        (car l)
        (list-ref (cdr l) (- n 1))))


(define suqares (list 1 4 9))
; (display (list-ref suqares 1))

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

; (display (length suqares))
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define odds (list 1 3 5))
(display (append suqares odds))
