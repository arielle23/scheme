#lang sicp
(define dx 0.000001)
(define (smooth f)
  (lambda (x)
    (three-average (f (- x dx)) (f x) (f (+ x dx)))))

(define (three-average a b c)
  (/ (+ a b c) 3))

(define (function x)
  (+ x 1))

;((smooth function) 1)
(define (compose g f)
  (lambda (x)
    (g (f x))))

(define (repeated-smooth f n)
  (lambda (g)
    (if (> n 1)
        ((compose f (repeated-smooth f (- n 1))) g)
        (f g))))

(((repeated-smooth smooth 3) function) 2)
