(define (adjoin_set x set)
    (cond ((or (null? set) (> (car set) x))
            (cons x set))
          ((= x (car set))
            set)
          (else
            (cons (car set) (adjoin_set x (cdr set))))))
(adjoin_set 6 (list 1 2 3 5 6))