(define (deriv exp var)
    (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                                (deriv (augend exp) var)))
        ((product? exp)
            (make-sum
                (make-product (multiplier exp) 
                                (deriv (multiplicand exp) var))
                (make-product (deriv (multiplier exp) var)
                                (multiplicand exp))))
        (else (error "Unknown expression type: DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
            ((=number? a2 0) a1)
            ((and (number? a1) (number? a2))
                (+ a1 a2))
            (else (list '+ a1 a2))))

(define (make-product a1 a2)
    (cond ((or (=number? a1 0) (=number? a2 0)) 0)
        ((=number? a1 1) a2)
        ((=number? a2 1) a1)
        ((and (number? a1) (number a2)) (* a1 a2))
        (else (list '* a1 a2))))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (=number? exp num) (and (number? exp) (= exp num)))

; test
(define (print item)
    (display item)
    (newline))
; (print (variable? `a))
; (print (same-variable? `a `a))
; (print (make-sum 1 2))
; (print (sum? `(+ 1 2)))

(print (deriv '(+ x 3) 'x))
