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
; 将未知问题转为已知问题
(define (sub-interval x y)
    (add-interval x
        (make-interval (- (lower-bound y)) (- (upper-bound y)))))

; (define (sub-interval x y)
;     (make-interval (- (lower-bound x) (lower-bound y))
;                     (- (upper-bound x) (upper-bound y))))
