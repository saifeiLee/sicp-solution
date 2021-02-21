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

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) (cdr rest))))
    (iter initial sequence))

(define (print item)
    (display item)
    (newline))
(print (accumulate / 1 (list 1 2 3)))

(print (fold-left / 1 (list 1 2 3)))
(print (accumulate list nil (list 1 2 3)))
(print (fold-left list nil (list 1 2 3)))

; (op a b) === (op b a) 满足交换律
