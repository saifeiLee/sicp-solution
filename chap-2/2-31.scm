(define nil '())



; (define (square-tree tree)
;     (map (lambda (sub-tree)
;         (if (pair? sub-tree)
;             (square-tree sub-tree)
;             (* sub-tree sub-tree)))
;         tree))

(define (tree-map transformer tree)
    (map (lambda (sub-tree) 
        (if (pair? sub-tree)
            (tree-map transformer sub-tree)
            (transformer sub-tree)))
        tree))

(define (square-tree tree)
    (tree-map square tree))

; test
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display (square-tree tree))
(newline)
