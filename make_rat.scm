(define make_rat cons)
(define numer car)
(define denom cdr)
(define (add_rat x y)
    (make_rat (+ (* (numer x) (denom y))
                 (* (denom x) (numer y)))
              (* (denom x) (denom y))))

(define (print_rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

(define x (make_rat 1 2))
(define y (make_rat 1 3))

(print_rat (add_rat x y))