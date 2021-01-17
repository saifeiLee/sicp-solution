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

(define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)

; 测试求导
; (define deriv_1 ((deriv (lambda (x) (square x))) 2))

; (display deriv_1)

(define (newton-transform g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))
