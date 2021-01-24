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

(define (print-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (print-point start)
    (print-point end)))

(define (make-rectangle upper-left-corner width height)
    (cons upper-left-corner
        (cons width height)))

(define (rect-width rect)
    (car (cdr rect)))

(define (rect-height rect)
    (cdr (cdr rect)))

(define (area rect)
    (* (rect-width rect)
        (rect-height rect)))

; 建立width height抽象屏障，使得面积和周长的计算不用更改
; test

(define rect-test (make-rectangle (make-point 1.0 1.0) 10 10))
(define test_area (area rect-test))
(display test_area)
