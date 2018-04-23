(define precision 0.00000000001)

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (absolute x)
  (if (< x 0)
  (- x)
  x))

(define (square x)
  (* x x))

(define (good-enough? pre-guess guess x)
  (< (/ (absolute (- pre-guess guess)) x) precision))

(define (sqrt-guess pre-guess guess x)
  (if (good-enough? pre-guess guess x)
      guess
      (sqrt-guess guess (improve guess x) x)))

(sqrt-guess 0.9 1. 100)