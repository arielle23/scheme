(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (count_leaves t)
    (accumulate + 0 
                    (map (lambda (sub_tree) 
                                 (if (pair? sub_tree)
                                     (count_leaves sub_tree)
                                     1))
                          t)))
(count_leaves (list 1 2 (list 2 3) (list 6 7 8) 9))