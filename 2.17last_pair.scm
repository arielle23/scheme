; (define (length items)
;     (define (length_iter items count)
;         (if (null? items)
;             count
;             (length_iter (cdr items) (+ count 1))))
;     (length_iter items 0))
(define (last_pair items)
    (if (null? (cdr items))
        (car items)
        (last_pair (cdr items))))
(last_pair (list 1 2 3 4 5))