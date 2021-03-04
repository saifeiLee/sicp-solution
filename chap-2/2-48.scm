(define (make-vect x y)
    (cons x y))

(define (xcor-vect vect)
    (car vect))

(define (ycor-vect vect)
    (cdr vect))

(define (add-vect vec1 vec2)
    (let ((x1 (xcor-vect vec1))
            (y1 (ycor-vect vec1))
            (x2 (xcor-vect vec2))
            (y2 (ycor-vect vec2)))
        (make-vert (+ x1 x2)
                    (+ y1 y2))))

(define (sub-vect vec1 vec2)
    (make-vect (- (xcor-vect vec1)
                  (xcor-vect vec2))
               (- (ycor-vect vec1)
                  (ycor-vect vec2))))

((define (scale-vect s vect)
    (make-vect (* s (xcor-vect vect))
                (* s (ycor-vect vect)))))

(define (make-segment v1 v2)
    (cons v1 v2))

(define (start-segment seg)
    (car seg))

(define (end-segment seg)
    (cdr seg))
