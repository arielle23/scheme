(define (multiply a b)
  (multiply-iter a b 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (multiply-iter a b n)
  (cond ((= b 1)
         (+ a n))
        ((even? b)
         (multiply-iter (double a) (halve b) n))
        (else
         (multiply-iter a (- b 1) (+ n a)))))
(multiply 17 9)