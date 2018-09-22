#lang sicp
(define (compose g f)
  (lambda (x)
    (g (f x))))

(define (a x)
  (+ x 1))

(define (b x)
  (+ x 2))

;((compose a b) 1)


(define (repeated f n)
  (lambda (x)
    (if (> n 1)
        ((compose f (repeated f (- n 1))) x)
        (f x))))

(define (square x)
  (* x x))

((repeated square 2) 5)




