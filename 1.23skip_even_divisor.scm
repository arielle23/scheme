#lang sicp
;better way to find smallest divisor
;if n can't be exactly divised,then skip all the even test-divisor

(define (find-smallest-divisor n test-divisor)
  (if (= (remainder n test-divisor) 0)
      test-divisor
      (find-smallest-divisor n (next test-divisor))))

(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))


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

;(even? 8)