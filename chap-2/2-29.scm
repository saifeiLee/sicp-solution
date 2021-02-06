; a
(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define (left-branch item)
    (car item))

(define (right-branch item)
    (car (cdr item)))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (cadr branch))
; b
(define (mobile? structure) (list? structure))

; 妙啊
(define (branch-weight branch)
    (let (structure (branch-structure branch))
        (if (mobile? structure)
            (total-weight structure)
            structure)))

(define (total-weight mobile)
    (let ((branch-left (left-branch mobile))
            (branch-right (right-branch mobile)))
        (+ (branch-weight branch-left)
            (branch-weight branch-right))))

; c
(define (torque branch)
    (* (branch-length branch)
        (branch-weight branch)))

(define (branch-balanced? left right)
    (= (torque left)
        (torque right)))

(define (balance? item)
    (let ((left (left-branch item))
            (right (right-branch item)))
        (let ((left-structure (branch-structure left))
                (right-structure (branch-structure right)))
            (and (branch-balanced? left right)
                (if (mobile? left-structure)
                    (balance? left-structure)
                    #t)
                (if (mobile? right-structure)
                    (balance? right-structure)
                    #t)))))

; d

; 需要修改选择器
