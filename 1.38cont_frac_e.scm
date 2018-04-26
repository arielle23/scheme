#lang sicp
;evaluate value of e
;base on Euler's De Fractonibus Continuis
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

(define (return-D-value k)
  (let ((re (remainder k 3)))
    (cond ((or (= re 1) (= re 0))
           1)
          (else (* 2 (/ (+ k 1) 3))))))

(define (e-value k)
  (+ 2.0 (cont-frac-recursion (lambda (i) 1.0) return-D-value k)))

;(return-D-value 8)
(e-value 100002)
