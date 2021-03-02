; wave - Primitive painter of drawing a crude line
; beside - compound painter that draws the first
;           painter' image in the left half and
;           the second painter's image in the right half of the frame

(define wave2 (beside wave (flip-vert wave)))
; (define wave4 (below wave2 wave2))

; flip-vert 上下颠倒画家
(define (flipped-pairs painter)
    (let ((painter2 (beside painter (flip-vert painter))))
        (below painter2 painter2)))
(define wave4 (flipped-pairs wave))


; 向右递归分割
(define (right-split painter n)
    ((if (= n 0)
        painter
        (let ((smaller (right-split painter (- n 1))))
            (beside painter (below smaller smaller))))))

(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ((up (up-split painter (- n 1)))
                (right (right-split painter (- n 1))))
            (let ((top-left (beside up up)
                    (bottom-right (below right right))
                    (corner (corner-split painter (- n 1)))))
                (beside (below painter top-left)
                        (below bottom-right corner))))))

