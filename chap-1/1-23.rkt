#!/usr/bin/racket
#lang racket

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
(define (prime n)
    (= (smallest-divisor n) n))

((define (time-prime-test n)
    (newline)
    (display n)
    (start-prime-test) n (current-milliseconds)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time)))

(define (report-time elapsed-time)
    (display " *** ")
    (display elapsed-time))
