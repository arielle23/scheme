;two methods to get a square list function

(define (square x)
    (* x x))

; (define (square_list items)
;     (if (null? items)
;         `()
;         (cons (square (car items)) (square_list (cdr items)))))

(define (square_list items)
    (map square items))
    
(square_list (list 1 2 3 4))