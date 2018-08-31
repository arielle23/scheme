(define (square_tree tree)
    (cond ((null? tree) `())
          ((not (pair? tree))
                (square tree))
          (else
            (cons (square_tree (car tree))
                  (square_tree (cdr tree))))))

(define (map_square_tree tree)
    (map (lambda (sub_tree) 
                        (if (pair? sub_tree)
                            (map_square_tree sub_tree)
                            (square sub_tree)))
         tree))

(map_square_tree (list 1 
                   (list 2
                         (list 3 4)
                         5)))