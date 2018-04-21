#lang sicp
(define (expmod base exp m)
  (define (square x)
  (* x x))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-try n x)
  (= (expmod x n n) x))

(define (fermat-test n)
  (fermat-try n (random n)))

(define (fermat-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fermat-prime? n (- times 1)))
        (else false)))

(fermat-prime? 199 10)