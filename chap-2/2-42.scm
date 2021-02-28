(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (print item)
    (display item)
    (newline))

(define empty-board nil)

; queens的实现思路比较清晰，问题是内部的那几个方法的实现原理

(define (queens board-size)
    ; 返回在棋盘的前k列放皇后的所有格局的序列
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                    (map (lambda (new-row) 
                        (adjoin-position new-row k rest-of-queens))
                (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
    (queen-cols board-size))

; adjoin-position的作用和原理？

(define (adjoin-position new-row k rest-queens)
    ; (list new-row k)的意思应该是'第new-row行第k列'
    (append rest-queens (list (list new-row k))))

(define (safe? k positions)
    (define (safe-pair? p1 p2)
        (let ((x1 (car p1))
                (y1 (cadr p1))
                (x2 (car p2))
                (y2 (cadr p2)))
            (not (or (= x1 x2)  ; row
                    (= (- x1 y1) (- x2 y2)) ; 对角线
                    (= (+ x1 y1) (+ x2 y2))))))   ; 反对角线
    (all_n (- k 1) (lambda (p)
                        (safe-pair? p (last positions)))
                    positions))


(define (all_n n pred items)
    (define (iter i items)
        (cond ((= i n) #t)
            ((pred (car items)) (iter (+ i 1) (cdr items)))
            (else #f)))
    (iter 0 items))

; test
(print (queens 4))
