;havn't run

;recursion version
(define (accumulate_r combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) 
            (accumulate combiner null-value term (next a) next b))))

;iteration version
(define (accumulate_i combiner null-value term a next b)
    (define (acc-iter a b result)
        (if (> a b)
            result
            (acc-iter (next a) b (combiner result (term a))))))            
