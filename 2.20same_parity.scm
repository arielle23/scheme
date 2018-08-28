(define odd 1)
(define even 0)
(define (make_list lst odd_even)
    (cond ((null? lst) `())
          ((= (remainder (car lst) 2) odd_even)
            (cons (car lst) (make_list (cdr lst) odd_even)))
          (else
            (make_list (cdr lst) odd_even))))
(define (same_parity x . lst)
    (if (= (remainder x 2) 0)
          (cons x (make_list lst even))
          (cons x (make_list lst odd))))

(same_parity 1 6 8)

