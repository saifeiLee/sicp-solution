(define (make-interval a b)
    (cons a b))

(define (upper-bound z)
(max (car z)
    (cdr z)))

(define (lower-bound z)
    (min (car z)
        (cdr z)))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                    (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
            (p2 (* (lower-bound x) (upper-bound y)))
            (p3 (* (upper-bound x) (lower-bound y)))
            (p4 (* (upper-bound x) (upper-bound y))))
        (make-interval (min p1 p2 p3 p4)
                        (max p1 p2 p3 p4))))

(define (div-interval x y)
    (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                    (/ 1.0 (lower-bound y)))))      

(define (par1 r1 r2)
    (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval one
                    (add-interval (div-interval one r1)
                                    (div-interval one r2)))))

(define r1 (make-interval 4 0.01))
(define r2 (make-interval 5 0.01))

(define test_1 (par1 r1 r2))
(define test_2 (par2 r1 r2))

(define test_3 (div-interval r1 r1))
(display test_3)
; (display test_1)
; (display test_2)

