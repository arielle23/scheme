(define (make_point x y)
    (cons x y))
(define (x_point x)
    (car x))
(define (y_point x)
    (cdr x))
(define (make_segment x y)
    (cons x y))
(define (start_segment x)
    (car x))
(define (end_segment x)
    (cdr x))
(define (print_point p)
    (newline)
    (display "(")
    (display (x_point p))
    (display ",")
    (display (y_point p))
    (display ")"))
(define (mid_point x)
    (make_point (/ (+ (x_point (start_segment x))
                      (x_point (end_segment x)))
                  2)
                (/ (+ (y_point (start_segment x))
                      (y_point (end_segment x)))
                  2)))
(print_point (mid_point 
    (make_segment (make_point 1 2)
                  (make_point 3 4))))