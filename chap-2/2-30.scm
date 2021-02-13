(define nil '())

; 方法1
; 我需要关心列表里的元素应该如何被处理以及处理后如何组合为结果的一部分
; (define (square-tree tree)
;     (cond ((null? tree) nil)
;         ((not (pair? tree)) (* tree tree))
;         (else
;             (cons (square-tree (car tree))
;                     (square-tree (cdr tree))))))
; 方法2
; 不需要关心元素如何被处理的细节和被处理后如何组合为结果的一部分
;❗️❗️❗️❗️❗️要反复体会❗️❗️❗️❗️
(define (square-tree tree)
    (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (square-tree sub-tree)
            (* sub-tree sub-tree)))
        tree))

; test
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display (square-tree tree))
(newline)


