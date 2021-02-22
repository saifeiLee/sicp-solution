(define (expmod base exp m)
    (cond ((= exp 0) 1)
            ((even? exp)
            (remainder (square (expmod base (/ exp 2) m)) m))
            (else 
                (remainder (* base (expmod base (- exp 1) m)) m))))

(define (prime? n)
    (define (try-it a)
        (= (expmod a n n) a))
    (cond ((= n 0) #f)
            ((= n 1) #t)
            ((= n 2) #t)
            ( else (try-it (random (- n 1))))))

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

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum? (flatmap
                        (lambda (i) 
                            (map (lambda (j) (list i j))
                                (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))
; test
; (print (prime-sum-pairs 6))

(define (remove x s)
    (filter (lambda (item) (not (= item x))) s))

(define (permutations s)
    (if (null? s)
        (list nil)
        (flatmap (lambda (x)
                    (map (lambda (p) (cons x p))
                        (permutations (remove x s))))
                s)))
(print (permutations (list 1 2 3)))
