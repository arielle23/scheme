(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
(length (list 1 2 3))