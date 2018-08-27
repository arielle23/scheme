(define (reverse lst)
    (reverse_iter lst `()))
(define (reverse_iter items result)
    (if (null? items)
        result
        (reverse_iter (cdr items) (cons (car items) result))))
(reverse (list 1 2 3 4))