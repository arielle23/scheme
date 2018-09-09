(define (encode message tree)
    (if (null? message)
        `()
        (append (encode_symbol (car message) tree)
                (encode (cdr message) tree))))

(define (make_code_tree left_branch right_branch)
    (list left_branch right_branch))
(define (make_leaf symbol weight)
    (list symbol weight))
(define left_branch car)
(define right_branch cadr)
(define (symbol_leaf leaf)
    (car leaf))
(define (leaf? branch)
    (symbol? (car branch)))
(define (encode_symbol symbol tree)
    (if (equal? (symbol_leaf (left_branch tree)) symbol)
        `(0)
        (if (leaf? (right_branch tree))
            (if (equal? (symbol_leaf (right_branch tree)) symbol)
                `(1)
                (error "bad code" symbol))
            (append `(1) (encode_symbol symbol (right_branch tree))))))
(define sample_tree
    (make_code_tree (make_leaf `A 4)
                    (make_code_tree (make_leaf `B 2)
                                    (make_code_tree (make_leaf `D 1)
                                                    (make_leaf `C 1)))))
(define sample_message `(0 1 1 0 0 1 0 1 0 1 1 1 0))
(encode `(a d a e b b c a) sample_tree)
