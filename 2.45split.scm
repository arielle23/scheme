(define (split x y)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split x y) painter (- n 1))))
                (x pinter (y smaller smaller))))))