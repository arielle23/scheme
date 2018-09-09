(define (make_code_tree left right)
    (list left
          right
          (append (symbols left) (symbols right))
          (+ (weight left) (weight right))))
(define left_branch car)
(define right_branch cadr)
(define (symbols tree)
    (if (leaf? tree)
        (list (symbol_leaf tree))
        (caddr tree)))
(define (weight tree)
    (if (leaf? tree)
        (weight_leaf tree)
        (cadddr tree)))
(define symbol_leaf cadr)
(define weight_leaf caddr)
(define (leaf? branch)
    (eq? (car branch) `leaf))
(define (make_leaf symbol weight)
    (list `leaf symbol weight))
(define (adjoin_set x set)
    (cond ((null? set) (list x))
          ((< (weight x) (weight (car set)))
            (cons x set))
          (else
            (cons (car set)
                  (adjoin_set x (cdr set))))))
(define (make_leaf_set pairs)
    (if (null? pairs)
        `()
        (let ((pair (car pairs)))
            (adjoin_set (make_leaf (car pair)
                                   (cadr pair))
                        (make_leaf_set (cdr pairs))))))
(define pairs_A (list (list `A 4) (list `B 2) (list `C 1) (list `D 1)))
(define (former_pairs pairs)
    (define (former_pairs_iter n pairs)
        (if (> n 0)
            (cons (car pairs)
                  (former_pairs_iter (- n 1) (cdr pairs)))
            `()))
    (former_pairs_iter (- (length pairs) 1) pairs))
(define (later_pair pairs)
    (define (later_pair_iter n pairs)
        (if (= n 1)
            (car pairs)
            (later_pair_iter (- n 1) (cdr pairs))))
    (later_pair_iter (length pairs) pairs))
(define (successive_merge pairs)
    (if (> (length pairs) 1)
        (make_code_tree (later_pair pairs)
                        (successive_merge (former_pairs pairs)))
        (car pairs)))
(define (generate_huffman_tree pairs)
    (successive_merge (make_leaf_set pairs)))

