; 跟唯一表的复杂度一样
(define (element-of-set? x set)
    (cond ((null? set) false)
            ((equal? x (car set)) true)
            (else (element-of-set? x (cdr set)))))
; 复杂度没变
(define (adjoin-set x set)
    (cons x set))

; same as non-duplicate set
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
            ((element-of-set? (car set1) set2)
                (cons (car set1) (intersection-set (cdr set1) set2)))
            (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2) (append set1 set2))

(define (print item)
    (display item)
    (newline))
; test
(define set1 (list 1 2 3))
(define set2 (list 3 4 5 6))
(print (union-set set1 set2))
