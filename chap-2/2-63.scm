(define (entry tree)
    (if (null? tree)
        '()
        (car tree)))

(define (left-branch tree)
    (if (null? tree)
        '()
        (cadr tree)))

(define (right-branch tree)
    (if (null? tree)
        '()
        (caddr tree)))

(define (make-tree entry left right)
    (list entry left right))


(define (element-of-set? x set)
    (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set)) 
          (element-of-set? x (left-branch set)))
        ((> x (entry set))
          (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
    (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set)) (make-tree (entry set)
                            (adjoin-set x (left-branch set))
                            (right-branch set)))
        ((> x (entry set))
            (make-tree (entry set)
                        (left-branch set))
                        (adjoin-set x (right-branch set)))))
(define (tree->list-1 tree)
    (if (null? tree)
        '()
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                        (tree->list-1
                            (right-branch tree))))))

(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree)
                        (cons (entry tree)
                            (right-branch tree)
                            result-list))))
    (copy-to-list ree '()))
; test
(define (print item)
    (display item)
    (newline))

(define sample-tree 
  (make-tree 
    1
    '() 
    (make-tree 
      2 
      '() 
      (make-tree 
        3 
        '() 
        (make-tree 
          4 
          '() 
          (make-tree 
            5 
            '() 
            (make-tree 
              6 
              '() 
              (make-tree 
                7 
                '() 
                '())))))))) 
(print sample-tree)


; 结果一样
; 时间复杂度不同，
; 第一种为: O(logn * n) 为什么呢？
; 第二种为: O(n)
