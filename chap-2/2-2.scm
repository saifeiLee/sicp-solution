(define (average a b)
    (/ (+ a b) 2))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))


(define (make-point x y)
    (cons x y))

(define (x-point p)
    (car p))

(define (y-point p)
    (cdr p))

(define (make-segment p1 p2)
    (cons p1 p2))

(define (start-point segment)
    (car segment))

(define (end-point segment)
    (cdr segment))

(define (midpoint-segment seg)
    (define (midpoint p1 p2)
        (let ((start-x (x-point p1))
              (end-x (x-point p2))
              (start-y (y-point p1))
              (end-y (y-point p2)))
        (make-point (average start-x end-x)
                (average start-y end-y))))
    (midpoint (start-point seg) (end-point seg)))

; test
(define p1 (make-point 2.0 4.0))
(define p2 (make-point 8.0 12.0))
(define seg (make-segment p1 p2))
; (display seg)
(define midpoint (midpoint-segment seg))
(display midpoint)
