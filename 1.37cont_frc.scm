#lang sicp
;the recursion process
(define (cont-frac-recursion n d k)
  (define (cont-iter i)
    (if (or (< i k) (= i k))
        (/ (n i) (+ (d i) (cont-iter (+ i 1))))
        0))
  (cont-iter 1))

;the iteration process
(define (cont-frac-iteration n d k)
  (define (cont-iter counter result)
    (if (= counter 0)
        result
        (cont-iter (- counter 1) (/ (n counter) (+ (d counter) result)))))
  (cont-iter k 0))

(cont-frac-iteration (lambda (i) 1.0) (lambda (i) 1.0) 100)

