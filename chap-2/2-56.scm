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
        ((exponentiation? exp)
            (make-product
                (power exp)
                (make-exponentiation (base exp) (- (power exp) 1))))
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
        ((and (number? a1) (number? a2)) (* a1 a2))
        (else (list '* a1 a2))))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

(define (make-exponentiation a1 a2)
    (cond ((=number? a2 0) 1)
            ((=number? a2 1) a1)
            (else (list '** a1 a2))))

(define (base exp) (cadr exp))

(define (power exp) (caddr exp))

; test
(define (print item)
    (display item)
    (newline))

; (print (deriv '(+ x 3) 'x))
(define exp (make-exponentiation 'x 3))
(print exp)
(print (base exp))
(print (power exp))
(print (deriv '(** x 3) 'x))
