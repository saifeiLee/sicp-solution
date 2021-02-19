(define nil '())

(define (filter predicate sequence)
    (cond ((null? sequence) nil)
        ((predicate (car sequence)) 
            (cons (car sequence)
                    (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define seq (list 1 2 3 4 5))
(define res (filter odd? seq))
; (display res)
(newline)

; (display (null? `()))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define test_2 (accumulate + 0 seq))
(display test_2)
