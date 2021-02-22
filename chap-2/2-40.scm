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
(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum? (flatmap
                        (lambda (i) 
                            (map (lambda (j) (list i j))
                                (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))

(define (unique-pairs n)
    (flatmap
        (lambda (i) 
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))

; test


(define nil '())


(define (print item)
    (display item)
    (newline))

(print (unique-pairs 3))
