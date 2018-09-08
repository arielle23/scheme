(define (element_of_set? x set)
    (cond ((null? set) false)
          ((equal? x (car set))
            true)
          (else
            (element_of_set? x (cdr set)))))
(define (adjoin_set x set)
    (if (element_of_set? x set)
        set
        (cons x set)))
(define (union_set set1 set2)
    (define (union_set_iter set1 set2 result)
            (if (and (null? set1) (null? set2))
                result
                (if (null? set1)
                    (union_set_iter set1 (cdr set2) (adjoin_set (car set2) result))
                    (union_set_iter (cdr set1) set2 (adjoin_set (car set1) result)))))
    (union_set_iter set1 set2 `()))
(union_set (list 1 2 3) (list 2 3 4 5))