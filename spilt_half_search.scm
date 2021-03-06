#lang sicp
(define precision 0.000000000000000001)

(define (search f negpoint pospoint)
  (define (close-enough? a b)
    (< (- b a) precision))
  (define (avarg a b)
    (/ (+ negpoint pospoint) 2))
  (define (pos-value? a)
    (> a 0))
  (let ((midpoint (avarg negpoint pospoint)))
    (if (close-enough? negpoint pospoint)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((pos-value? test-value)
                 (search f negpoint midpoint))
                ((= test-value 0)
                 midpoint)
                (else
                 (search f midpoint pospoint)))))))


(define (function a)
  (- (* a 5) 4))

(search function (- 0 1) 2.0)


