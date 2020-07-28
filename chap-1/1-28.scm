; TODO: 为什么expmod可以这样计算
(define (expmod base exp m)
    (cond ((= exp 0) 1)
            ((even? exp)
            (remainder (square (expmod base (/ exp 2) m)) m))
            (else 
                (remainder (* base (expmod base (- exp 1) m)) m))))
; 这一题没看懂，不会做
