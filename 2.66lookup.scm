(define (make_tree entry left_tree right_tree)
    (list entry left_tree right_tree))
(define (entry tree)
    (car tree))
(define (left_tree tree)
    (cadr tree))
(define (right_tree tree)
    (caddr tree))
(define (look_up key tree)
    (cond ((null? tree) false)
          ((= (entry tree) key) true)
          (else
            (if (> key (entry tree))
                (look_up key (right_tree tree))
                (look_up key (left_tree tree))))))
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
(look_up 9 (list->tree (list 2 3 4 7 9 10)))