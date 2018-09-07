(define (my_equal? lst1 lst2)
    (cond ((and (null? lst1) (null? lst2)) true)
          ((and (pair? (car lst1)) pair? (car lst2))
            (and (my_equal? (car lst1) (car lst2)) (my_equal? (cdr lst1) (cdr lst2))))
          ((eq? (car lst1) (car lst2))
            (my_equal? (cdr lst1) (cdr lst2)))
          (else
            false)))
(my_equal? `(this is a list) `(this (is a) list))
