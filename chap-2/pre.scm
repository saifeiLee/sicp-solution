(define (add-rat x y)
    (make-rat (+ (* (number x) (denom y))
                (* (number y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat (- (* (number x) (denom y))
                (* (number y) (denom x)))
            (* (denom x) (denom y))))

(define (multi-rat x y)
    (make-rat (* (number x) (number y))
                (* (denom x) (denom y))))

(define (div-rat x y)
    (make-rat (* (number x) (denom y))
                (* (number y) (denom x))))

(define (equal-rat? x y)
    (= (* (number x) (denom y))
        (* (number y) (denom x))))

(define (make-rat n d)
    (let ((g (gcd n d)))
        (cons (/ n g) (/ d g))))

(define (number x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
    (newline)
    (display (number x))
    (display "/")
    (display (denom x)))


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define one-half (make-rat 1 2))
(print-rat one-half)
(define one-third (make-rat 1 3))
(print-rat (add-rat one-third one-third))
