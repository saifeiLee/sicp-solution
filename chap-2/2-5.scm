(define (cons a b)
    (* (expt 2 a)
        (expt 3 b)))

(define (extract-expt n z)
    (define (divides? a b)
        (= (remainder b a) 0))

    (define (iter k acc)
        (if (divides? n k)
            (iter (/ k n) (+ acc 1))
            acc))
    (iter z 0))

(define (car z) (extract-expt 2 z))

(define (cdr z) (extract-expt 3 z))


; test
(define test (cons 2 3))

(define test_car (car test))
(define test_cdr (cdr test))

(display test_car)
(newline)
(display test_cdr)
