(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define nil '())

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
                (accumulate-n op init (map cdr seqs)))))

(define test_list (list (list 1 2 3) (list 4 5 6)))
(define res (accumulate-n + 0 test_list))
(display res)
