(define (deep_reverse lst)
    (deep_reverse_iter lst `()))
(define (deep_reverse_iter items result)
    (cond ((null? items) result)
          ((pair? (car items))
            (deep_reverse_iter (cdr items) (cons (deep_reverse (car items)) result)))
          (else
            (deep_reverse_iter (cdr items) (cons (car items) result)))))

(deep_reverse (list 1 2 (list 3 4)))
