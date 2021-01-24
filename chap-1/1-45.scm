(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        f
        (repeated (compose f f) (- n 1))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                guess
                (try next))))
    (try first-guess))

(define (average a b)
    (/ (+ a b) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (cubic-root x)
    (fixed-point (average-damp (lambda (y) (/ x (square y)))) 
                1.0))

(define (square-root x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 
                1.0))

(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

(define logB 
    (lambda (x B) 
      (/ (log x) (log B))))

(define (dump-number n)
    (floor (logB n 2)))

(define (n-square-root x n)
    (fixed-point-of-transform
        (lambda (y) (/ x (expt y (- n 1))))
        (repeated average-dump (logB n)) 
        1.0))
