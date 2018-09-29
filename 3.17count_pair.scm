(define (last_pair x)
    (if (null? (cdr x))
        x
        (last_pair (cdr x))))

(define (count_pair x)
    (define (iter_count record x)
        (if (and (pair? x)
                 (false? (memq x record)))
            (iter_count (iter_count (cons x record) (cdr x)) (car x))
            record))
    (length (iter_count `() x)))

(define lst (list `a `b `c))
(set-cdr! (last_pair lst) lst)
; ((set! new_pair (cons (car lst) `())) new_pair)
(count_pair lst)