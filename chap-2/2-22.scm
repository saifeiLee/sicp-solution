(define nil '())

(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons (square (car things))
                        answer))))
    (iter items nil))

; (define items-1 (list 1 2 3))
; (define test (square-list items-1))
; (display test)

; 顺序相反原因是迭代法按照顺序逐个处理元素，处理后的结果逐个加入结果list的首部，导致后处理的元素在结果中的位置靠前
(define (square-list-2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons answer
                        (square (car things))))))
    (iter items nil))

(define items-1 (list 1 2 3))
(define test (square-list-2 items-1))
(display test)
; cons的第二个参数必须是list
