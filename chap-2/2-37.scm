(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
                (accumulate-n op init (map cdr seqs)))))

(define nil '())

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

;test
; (define seq1 (list 1 2 3))
; (define seq2 (list 4 5 6))
; (define seq3 (list 4 5 6))

; (define res (map * seq1 seq2 seq3))

; (display res)

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))

; 这个很妙
(define (transpose mat)
    (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (row) (matrix-*-vector cols row)) m)))

(define matrix (list (list 1 2) (list 1 2)))
(define res (matrix-*-matrix matrix (list (list 1 2) (list 1 2))))

(display res)
