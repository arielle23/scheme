#lang sicp

;find "count" prime numbers greater than n
;find prim: the smllest divisor

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
        (else false)));the fermat-test

(define (find-smallest-divisor n test-divisor)
  (if (= (remainder n test-divisor) 0)
      test-divisor
      (find-smallest-divisor n (+ test-divisor 1))))

(define (smallest-divisor n)
  (find-smallest-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n)) ;the divisor function

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
        (report-prime (- (runtime) start-time)))
        (else #f)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes n count)
  (cond ((> count 0)
         (search-for-primes (inc n)
                            (if (timed-prime-test n)
                                (dec count)
                                count)))))

(search-for-primes 10000 3)
