(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (new-p p q)
                   (new-q p q)
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (new-q p q)
  (+ (* 2 p q) (* q q)))

(define (new-p p q)
  (+ (* p p) (* q q)))

(fib  9)