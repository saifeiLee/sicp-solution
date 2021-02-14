(define nil '())

(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest (map (lambda (x) (append (list (car s)) x)) rest)))))
; 解释

; 一个集合（a,b,c）的全部子集可以理解为由不包含a的全部子集加上包含a的全部子集构成

; test
(define test_case (list 1 2 3))
(define result (subsets test_case))
(display result)
