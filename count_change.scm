(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds 0)) 0)
        (else (+ (cc amount (- kinds 1))
                 (cc (- amount (coin-val kinds)) kinds)))))

(define (coin-val kinds)
  (cond ((= kinds 1) 1)
        ((= kinds 2) 5)
        ((= kinds 3) 10)
        ((= kinds 4) 25)
        ((= kinds 5) 50)))

(count-change 11)
