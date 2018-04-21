(define (sqrot x)
  (define precision 0.0000000001)
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (good-enough? guess)
    (< (absolute (- x (square guess))) precision))
  (define (absolute x)
    (if (< x 0)
        (- x)
        x))
  (define (square x)
    (* x x))
  (define (square-root guess x)
    (if (good-enough? guess)
        guess
        (square-root (improve guess) x)))
  (square-root 1. x))

(sqrot 81)


