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

; (define (enumerate-interval low high)
;     (if (> low high)
;         nil
;         (cons low (enumerate-interval (+ low 1) high))))

; (print (enumerate-interval 1 4))

