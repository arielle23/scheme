#lang sicp
(define dx 0.0000001)
(define (derive g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((derive g) x)))))
(define (newton-method g guess)
  (fix_point (newton-transform g) guess))

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

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a (* x x)) (* b x) c)))

(newton-method (cubic 1 2 3) 1)

(define a (- 0 1.27))

(+ (* a a a) (* a a) (* 2 a) 3)

