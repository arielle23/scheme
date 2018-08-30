(define (for_each proc lst)
    (if (null? lst)
        (null? lst)
        (cons (proc (car lst)) (for_each proc (cdr lst)))))

(for_each (lambda (x) (newline) (display x))
    (list 34 23 24 54))