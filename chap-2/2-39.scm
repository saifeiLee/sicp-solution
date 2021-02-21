
(define nil '())


(define (print item)
    (display item)
    (newline))

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

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) (cdr rest))))
    (iter initial sequence))

(define (fold-right op init seqs)
    (accumulate op init seqs))

(define (reverse sequence)
    (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-v2 sequence)
    (fold-left (lambda (x y) (cons y x)) nil sequence))

; (define (reverse-v2 sequence)
;     (fold-left (lambda (x y) (append (list y) x)) nil sequence))

; test
; (print (reverse (list 1 2 3)))
; (print (reverse-v2 (list 1 2 3)))

(print (cons 1 nil))
(print (cons 2 `(1)))
(print (cons 3 `(2 1)))
