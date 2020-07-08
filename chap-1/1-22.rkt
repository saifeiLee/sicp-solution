#!/usr/bin/racket
#lang racket/base

(require dyoo-while-loop)

(define (smallest-divisor  n)
    (find-divisor n 2))

(define (find-divisor n guess)
    (cond ((> (square guess) n) n)
        ((divides? guess n) guess)
        (else (find-divisor n (+ guess 1)))))

(define (divides? m n)
    (= (remainder n m ) 0))

(define (square n)
    (* n n))

; 素数检测
(define (prime? n)
    ; (display n)
    (= (smallest-divisor n) n))

(define (time-prime-test n)
    (newline)
    ; (display n)
    (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (current-milliseconds) start-time))
        (display "not prime")))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (search-for-prime n)
    (if (divides? 2 n) (search-for-prime (+ n 1))
        (   
            ; else
            begin
            (while (not (prime? n)) (set! n (+ n 1)))
            (start-prime-test n (current-milliseconds))
        )
    )
)

(search-for-prime 1000)
(search-for-prime 10000)
