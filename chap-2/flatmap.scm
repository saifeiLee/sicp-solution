
(define nil '())

(define (print item)
    (display item)
    (newline))
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (unique-pairs n)
    (map
        (lambda (i) 
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))
; (print (unique-pairs 6))

(print (append `((5 6)) `((1 2) (3 4))))
