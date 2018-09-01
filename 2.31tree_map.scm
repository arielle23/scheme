(define (tree_map proc tree)
    (cond ((null? tree) `())
          ((pair? tree)
                (cons (tree_map proc (car tree))
                      (tree_map proc (cdr tree))))
          (else
            (proc tree))))

(tree_map square (list 1
                       (list 2 (list 3 4) 5)
                                           (list 6 7)))