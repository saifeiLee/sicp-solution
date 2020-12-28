(define (f g)
    (g 2))

(define test_1 (f square))
(display test_1)
(display "\n")

(define test_2 (f f))
(display test_2)

; 解释：
; 报错：2 is not applicable, 原因在第二次递归调用时，2作为f过程的第二个参数被传入
