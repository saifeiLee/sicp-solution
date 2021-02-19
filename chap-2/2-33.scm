(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define nil '())

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
; test 1
; (define test_list (list 1 2 3))
; (define (procedure x) (+ x 1))
; (define test_res_1 (map procedure test_list))
; (display test_list)
; (newline)
; (display test_res_1)
; (newline)

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))
; test 2
; (define test_seq_1 (list 1 2 3))
; (define test_seq_2 (list 4 5 6))
; (define res (append test_seq_1 test_seq_2))
; (display res)

(define (length sequence)
    (accumulate (lambda (x y) (+ y 1)) 0 sequence))

; test 3
(define test_seq (list 1 2 3))
(define res (length test_seq))
(display res)
