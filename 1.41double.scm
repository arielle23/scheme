#lang sicp
(define (double-f g)
  (lambda (x)
    (g (g x))))
(define (inc x)
  (+ x 1))
;((double-f inc) 1)

(((double-f (double-f double-f)) inc) 0)
;(((double-f double-f) inc) 0)
