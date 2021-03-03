(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (top-split painter (-  n 1))))
            (below painter (beside smaller smaller)))))

(define (right-split painter n)
    ((if (= n 0)
        painter
        (let ((smaller (right-split painter (- n 1))))
            (beside painter (below smaller smaller))))))

; split是一种更抽象的描述
; 从f, g的职责入手去理解
; 对照着up-split, right-split的实现，也可以推出split的实现
(define (split f g)
    (lambda (painter n) 
        (if (= n 0)
            painter
            (let ((smaller ((split f g) painter (- n 1))))
                (f painter (g smaller smaller))))))
