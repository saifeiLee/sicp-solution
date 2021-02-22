(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

; why use flatmap? not map?
; 为什么不会产生(1, 1)序列?
(define (unique-pairs n)
    (flatmap
        (lambda (i) 
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))

(define nil '())

(define (print item)
    (display item)
    (newline))

; step 1: find all ordered triples
; step 2: filter the sum equal to s

(define (sum-triple t)
    (+ (car t) (cadr t) (caddr t)))

(define (ordered-triples n)
    (flatmap (lambda (i) 
            (flatmap (lambda (j) 
                    (map (lambda (k)
                        (list i j k))
                    (enumerate-interval 1 (- j 1))))
                (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

(define (order-triple-sum n s)
    (filter (lambda (triple)
                (= (sum-triple triple) s))
            (ordered-triples n)))

; test
; (print (unique-pairs 3))
; (print (enumerate-interval 1 1))
(print (order-triple-sum 4 6))
