(define nil '())

(define (deep-reverse items)
    (define (iter z accu)
        (if (null? z)
            accu
            (let ((head (car z))
                    (tail (cdr z)))
                (if (list? head)
                    (iter tail (append  (list (deep-reverse head)) accu))
                    (iter tail (append (list head) accu))))))
    (iter items nil))

(define items (list (list 1 2) (list 3 4)))
(display items)
(newline)
(display (deep-reverse items))
