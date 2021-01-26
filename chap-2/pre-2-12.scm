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

(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (center i)
    (/ (+ (upper-bound i) (lower-bound i)) 2))
