(define (make_tree entry left_tree right_tree)
    (list entry left_tree right_tree))
(define (right_branch tree)
    (caddr tree))
(define (left_branch tree)
    (cadr tree))
(define (entry tree)
    (car tree))
(define (tree->list tree)
    (define (copy_to_list tree result_tree)
        (if (null? tree)
            result_tree
            (copy_to_list (left_branch tree)
                          (cons (entry tree)
                                (copy_to_list (right_branch tree)
                                              result_tree)))))
    (copy_to_list tree `()))
(define (list->tree elements)
    (car (partial_tree elements (length elements))))
(define (partial_tree elts n)
    (if (= n 0)
        (cons `() elts)
        (let ((left_size (quotient (- n 1) 2)))
            (let ((left_result (partial_tree elts left_size)))
                (let ((left_tree (car left_result))
                      (non_left_elts (cdr left_result))
                      (right_size (- n (+ left_size 1))))
                    (let ((this_entry (car non_left_elts))
                          (right_result (partial_tree (cdr non_left_elts) 
                                                      right_size)))
                        (let ((right_tree (car right_result))
                              (remaining_elts (cdr right_result)))
                            (cons (make_tree this_entry left_tree right_tree)
                                  remaining_elts))))))))
(define (union_set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          ((< (car set1) (car set2))
            (cons (car set1) (union_set (cdr set1) set2)))
          ((< (car set2) (car set1))
            (cons (car set2) (union_set set1 (cdr set2))))
          (else
            (cons (car set1) (union_set (cdr set1) (cdr set2))))))
(define (union_set_tree tree1 tree2)
    (list->tree (union_set (tree->list tree1)
                           (tree->list tree2))))
(define tree_A
    (list->tree (list 0 3 6 9 12)))
(define tree_B
    (list->tree (list 0 2 4 6 8 10 12)))
(union_set_tree tree_A tree_B)
(define (intersection_set set1 set2)
    (if (or (null? set1) (null? set2))
        `()
        (cond ((> (car set1) (car set2))
                (intersection_set set1 
                                  (cdr set2)))
              ((> (car set2) (car set1))
                (intersection_set (cdr set1) 
                                  set2))
              (else
                (cons (car set1) 
                      (intersection_set (cdr set1) 
                                        (cdr set2)))))))
(define (intersection_set_tree tree1 tree2)
    (list->tree (intersection_set (tree->list tree1) (tree->list tree2))))
(intersection_set_tree tree_A tree_B)