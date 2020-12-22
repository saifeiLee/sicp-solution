; 前置过程

; (define (sum-integers a b)
;     (if (> a b)
;         0
;         (+ a (sum-integers (+ a 1) b))))

; (sum-integers 1 3)
; (display (sum-integers 1 3))
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (cube x)
    (* x x x))


(define (inc n) (+ n 1))

(define (sum-cubes a b)
    (sum cube a inc b))

(sum-cubes 1 5)
; (display (sum-cubes 1 5))
;(display (cube 2))

; 普通积分法

(define (integral fx a b dx)
    (define (add-dx x) (+ x dx))    ; 使用闭包获取dx
    (* (sum fx (+ a (/ dx 2)) add-dx b)
        dx))

(define (fx x) x)

(display "普通积分法\n")

(display (integral fx 0 1 0.001))
(display "\n")

(define (simpson f a b n)
    (define h (/ (- b a) n))

    (define (yk k) 
        (f (+ a (* k h))))
    (define (term k)
        (* (cond ((= k 0) 1)
            ((= n k) 1)
            ((even? k) 2)
            (else 4))
            (yk k)))
    (define (inc x) (+ 1 x))
    (/ (* h (sum term 0 inc n)) 3))

(display "Simpson\n")
(display (simpson fx 0 1 1000))
(display "\n")
