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

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
