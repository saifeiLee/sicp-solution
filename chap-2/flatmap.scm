
(define nil '())

(define (print item)
    (display item)
    (newline))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (unique-pairs n)
    (flatmap
        (lambda (i) 
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))
