(define (make_vect x y)
    (list x y))
(define (xcor_vect vect)
    (car vect))
(define (ycor_vect vect)
    (cadr vect))
; (define (make_frame origin edge1 edge2)
;     (list origin edge1 edge2))
; (define (origin_frame frame)
;     (car frame))
; (define (edge1_frame frame)
;     (cadr frame))
; (define (edge2_frame frame)
;     (caddr frame))
(define (make_frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))
(define origin_frame car)
(define edge1_frame cadr)
(define edge2_frame cddr)
(origin_frame (make_frame (make_vect 1 2) (make_vect 3 4) (make_vect 5 6)))
(edge1_frame (make_frame (make_vect 1 2) (make_vect 3 4) (make_vect 5 6)))
(edge2_frame (make_frame (make_vect 1 2) (make_vect 3 4) (make_vect 5 6)))