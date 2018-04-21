(define precision 0.00000000001)

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (absolute x)
  (if (< x 0)
  (- x)
  x))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (absolute (- guess (/ x guess))) precision))

(define (sqrt-guess guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-guess (improve guess x) x)))

(sqrt-guess 1. 100)

