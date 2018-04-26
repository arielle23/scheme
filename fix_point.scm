#lang sicp
(define precision 0.00001)

(define (fix_point f first-guess)
  (define (absolute x)
  (if (< x 0)
      (- 0 x)
      x))
  (define (close-enough? a b)
    (< (absolute (- a b)) precision))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
       (newline)
       (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fix_point (lambda (x) (/ (log 1000) (log x))) 2.0)


