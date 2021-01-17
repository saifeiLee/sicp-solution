(define (cont-frac n d k)
    (define (iter i)
        (/ (n i)
            (+ (d i)
                (if (= i k)
                    0
                    (iter (+ i 1))))))
    (iter 1))

(define (divides? m n)
    (= (remainder m n) 0))

(define (appr-e k)
    (define (n i) i)
    (define (d i)
        (if (divides? (+ i 1) 3)
            (* 2 (/ 3 (+ 1 i)))
            1))
    (+ 2.0 (cont-frac n d 100)))

(define test_1 (appr-e 1000))
(display test_1)
