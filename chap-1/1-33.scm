; 基于1-32再做一层抽象：使用谓词过滤符合条件的数, 使计算对象不再仅仅是x + 1
; (define (filtered-accumulate combiner null-value term a next b predicate)
;     (define (accumulate combiner null-value term a next b)
;         (if (> a b)
;             null-value
;             (combiner 
;                 (term a)
;                 (filtered-accumulate combiner null-value term (next a) next b predicate))))
;     (if (not (predicate a))
;         (filtered-accumulate combiner null-value term (next a) next b predicate)
;         (accumulate combiner null-value term a next b)))

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) 
                    (filtered-accumulate combiner null-value 
                                         term (next a) next b filter))
          (combiner null-value
                    (filtered-accumulate combiner null-value
                                         term (next a) next b filter)))))

(define (add x y) (+ x y))
(define (fx x) x)
(define (inc x) (+ x 1))
(define (multiply x y) (* x y))

;-----test code---
; 表示sum
(define (sum_int_range a b) (filtered-accumulate add 0 fx a inc b integer?))
; (display (sum_int_range 1 3))
; (display "\n")
; (display (sum_int_range 1 4))
; (display "\n")
; (display (sum_int_range 1 5))
; (display "\n")
; 表示乘积
(define (multiply_int_range a b) (filtered-accumulate multiply 1 fx a inc b integer?))
; (display (multiply_int_range 1 3))

; ----------
(define (expmod base exp m)
    (cond ((= exp 0) 1)
            ((even? exp)
            (remainder (square (expmod base (/ exp 2) m)) m))
            (else 
                (remainder (* base (expmod base (- exp 1) m)) m))))

(define (prime? n)
    (define (try-it a)
        (= (expmod a n n) a))
    (cond ((= n 0) #f)
            ((= n 1) #t)
            ((= n 2) #t)
            ( else (try-it (random (- n 1))))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

; (define (prime? n)
;   (= n (smallest-divisor n)))

(define (sum_square_prime a b) (filtered-accumulate add 0 square a inc b prime?))
; 1, 2, 3, 5,
; 1, 4, 9, 25,

; (display (sum_square_prime 1 5))
; (display "\n")
; (display (sum_square_prime 1 6))
; (display "\n")
; (display (prime? 4))

; (display (random 1))
; (display (random 2))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; 小于n的所有与n互素的正整数之乘积
(define (product-gcd-n n)
  (define (filter i)
    (if (and (= i n) (> i n))
      #f
      (= (gcd i n) 1)))
  (filtered-accumulate multiply 1 fx 1 inc n filter))

; test n === 7
; 1, 2, 3, 4, 5, 6
(define res_1 (product-gcd-n 7))
(display res_1)
