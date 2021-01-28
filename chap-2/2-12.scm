(define (make-interval a b)
    (cons a b))

(define (upper-bound z)
    (max (car z)
        (cdr z)))

(define (lower-bound z)
    (min (car z)
        (cdr z)))

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))

; 注意将问题转为已知范围
(define (make-center-percent c p)
        (let ((w (* 0.01 c p)))
            (make-center-width c w)))

(define (width z)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (center z)
    (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (percent i)
    (let ((w (width i))
            (c (center i)))
        (* 100.0 (/ w c))))
