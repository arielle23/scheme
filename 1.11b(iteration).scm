(define (f n)
  (f-iter 0 1 2 n))

(define (f-iter first second third n)
  (cond ((< n 3) n)
        ((= n 3) (expr first second third))
        (else (f-iter second third
                      (expr first second third) (- n 1)))))

(define (expr first second third)
  (+ (* 3 first) (* 2 second) third))

(f 7)

