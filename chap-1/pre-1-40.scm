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

(define (average x y)
    (/ (+ x y) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (cubic-root x)
    (fixed-point (average-damp (lambda (y) (/ x (square y)))) 
                1.0))

(define (square-root x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 
                1.0))

(define test_1 (cubic-root 27))
(define test_2 (square-root 4))
(display test_1)
(newline)
(display test_2)

(define test_3 (fixed-point cos 1.0))
(newline)
(display test_3)
