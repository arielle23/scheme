(define function
    (let ((init 1))
        (lambda (x)
            (if (= x 0)
                (begin (set! init 0) 0)
                init))))
(define f1 function)
(define f2 function)
(+ (f1 0) (f1 1))