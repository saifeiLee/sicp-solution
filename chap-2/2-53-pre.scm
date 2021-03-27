(define (memq item x)
    (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(define (print item)
    (display item)
    (newline))

; (print (eq? 1 1))

(define list1 (list 1 2 3))
(print (memq 2 list1))
