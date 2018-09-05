(define (make_vect x y)
    (list x y))
(define (xcor_vect vect)
    (car vect))
(define (ycor_vect vect)
    (cadr vect))
(ycor_vect (make_vect 4 5))
(define (add_vect vect1 vect2)
    (make_vect (+ (xcor_vect vect1) (xcor_vect vect2))
               (+ (ycor_vect vect1) (ycor_vect vect2))))
(define (sub_vect vect1 vect2)
    (make_vect (- (xcor_vect vect1) (xcor_vect vect2))
               (- (ycor_vect vect1) (ycor_vect vect2))))
(define (scale_vect s vect)
    (make_vect (* s (xcor_vect vect))
               (* s (ycor_vect vect))))
(sub_vect (make_vect 7 8) (make_vect 1 2))
(add_vect (make_vect 1 2) (make_vect 2 3))
(scale_vect 4 (make_vect 2 3))