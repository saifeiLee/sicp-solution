(define (pow base exp)
    (define (iter base exp accu)
        (if (= exp 0)
            accu
            (iter base (- exp 1) (* base accu))))
    (iter base exp 1))

; (define test (pow 2 2))
; (display test)

(define (tan-cf x k)
    (define (n i) 
            (if (= i 1)
                x
                (* x x)))
    (define (d i) (- (* 2 i) 1))
    
    (define (recur i)
        (/ (n i)
            (- (d i) 
                (if (= i k)
                        0
                        (recur (+ i 1))))))
    (recur 1))
(define test_1 (tan-cf 2 10))
(display test_1)
