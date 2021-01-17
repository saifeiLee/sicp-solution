(define (cont-frac n d k)
    (define (iter i)
        (/ (n i)
            (+ (d i)
                (if (= i k)
                    0
                    (iter (+ i 1))))))
    (iter 1))
(define cont_frac_100 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100))

(define (average x y)
    (/ (+ x y) 2))

(define golden_ratio (average 1 (sqrt 5)))
(display golden_ratio)
(newline)
(display (/ 1 cont_frac_100))
(newline)

(define (close-enough? x y)
    (< (abs (- x y)) 0.0001))
(if (close-enough? golden_ratio (/ 1 cont_frac_100))
    (display "OK\n")
    (display "Not OK\n"))


; 递归写法

(define (cont-frac-iter n d k)
    (define (iter i acc)
        (if (= 0 i)
            acc
            (iter (- i 1) (/ (n i) (+ (d i) acc)))))
    (iter k 0))

(define cont_frac_100-v2 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 100))
(display cont_frac_100-v2)
