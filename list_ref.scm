(define (length items)
    (define (length_iter items count)
        (if (null? items)
            count
            (length_iter (cdr items) (+ count 1))))
    (length_iter items 0))
;the iterative method

; (define (length items)
;     (if (null? items)
;         0
;         (+ 1 (length (cdr items)))))
;the recursion method

(length (list 1 2 3 4 5))

(define (append_list list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append_list (cdr list1) list2))))

(define list1 (list 1 2 3 4))
(append_list list1 list2)

