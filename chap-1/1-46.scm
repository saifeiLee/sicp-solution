(define (iterative-improve good-enough? improve)
    (lambda (guess) 
        (if (good-enough? guess)
            guess
            ((iterative-improve good-enough? improve)
                (improve guess)))))

(define (sqrt x)
    (define (good-enough? guess)
        (let ((tolerance 0.001))
            (< (abs (- (square guess) x)) tolerance)))
    (define (average a b)
        (/ (+ a b) 2))
    ; improve是推动程序正确计算的关键
    (define (improve guess)
        (average guess (/ x guess)))
    ((iterative-improve good-enough? improve) 1.0))

; test sqrt
; (define test_1 (sqrt 4))
; (display test_1)

(define (fixed-point f guess)
    (define (close-enough? v1 v2)
        (let ((tolerance 0.0001))
            (< (abs (- v1 v2)) tolerance)))
    (let ((good-enough? (lambda (x) (close-enough? x (f x))))
        (improve f))
    ((iterative-improve good-enough? improve) guess)))

(define (f x)
    (+ 1 (/ 1 x)))

(define test_2 (fixed-point f 2.0))
(display test_2)
