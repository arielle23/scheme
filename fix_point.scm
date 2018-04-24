#lang sicp
(define precision 0.01)

(define (fix_point f first-guess)
  (define (absolute x)
  (if (< x 0)
      (- 0 x)
      x))
  (define (close-enough? a b)
    (< (absolute (- a b)) precision))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (function x)
  (- (* x 3) 1))

(fix_point function 0)


