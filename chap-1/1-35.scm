(define tolerance 0.00001)
(define (fix-point f first-guess)
    (define (good-enough? guess next)
        (< (abs (- guess next)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (good-enough? guess next)
                guess
                (try next))))
    (try first-guess))

; test
; (define cos_1 (fix-point cos 1))
; (display cos_1)

; 求黄金分割的值
(define gold_divide_pnt (fix-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
(display gold_divide_pnt)
(display "\n")
