(define (make-interval a b)
    (cons a b))

(define (upper-bound z)
    (max (car z)
        (cdr z)))

(define (lower-bound z)
    (min (car z)
        (cdr z)))

(define (make-center-percent c p)
    (make-interval (- c (* c p)) (+ c (* c p))))

(define (width z)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (center z)
    (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (percent i)
    (let ((w (width i))
            (c (center i)))
        (* 100.0 (/ w c))))
