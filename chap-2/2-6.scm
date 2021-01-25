(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; (define (plus a b))

(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

; 1
; (add-1 zero)
; (lambda (f) 
;     (lambda (x) 
;         (f ((
;             (lambda (f) 
;                 (lambda (x) x)) f) x))))

; (lambda (f) 
;     (lambda (x) 
;         (f ((lambda (x) x) x))))

; (lambda (f) 
;     (lambda (x) 
;         (f (x))))

; 2
; (add-1 one)
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define (inc x)
    (+ x 1))

; (display (((add-1 zero) inc) 1))

; (define test_0 ((zero inc ) 0))
; (display test_0)

; (define test_1 (add-1 zero))
; (display test_1)

(define (plus a b)
    (lambda (f)
        (lambda (x)
            ((a f) ((b f) x)))))
; Church计数的加法针对的是同样用`过程`表示的数字， 【他的参数是过程！】
(display (((plus one two) inc) 0))
