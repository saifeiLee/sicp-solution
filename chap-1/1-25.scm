(define (smallest-divisor n)
  (find-divisor n 2))

(define (square m)
    (display "square ")(display m)(newline) 
    (* m m))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
            ((even? exp)
            (remainder (square (expmod base (/ exp 2) m)) m))
            (else 
                (remainder (* base (expmod base (- exp 1) m)) m))))


(define (fast-expt b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(expmod 5 101 101)

(remainder (fast-expt 5 101) 101)
