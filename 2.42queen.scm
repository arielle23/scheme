(define (accumulate op init sequence)
    (if (null? sequence)
        init
        (op (car sequence)
            (accumulate op init (cdr sequence)))))
(define (flatmap proc sequence)
    (accumulate append `() (map proc sequence)))
(define (enumerate_interval low high)
    (if (> low high)
        `()
        (cons low
              (enumerate_interval (+ low 1) high))))
(define (queens board_size)
    (define empty_board `())
    (define (queen_cols k)
        (if (= k 0)
            (list empty_board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest_of_queens)
                        (map (lambda (new_row)
                                (adjoin_position new_row k rest_of_queens))
                             (enumerate_interval 1 board_size)))
                    (queen_cols (- k 1))))))
    (queen_cols board_size))
(define (adjoin_position new_row k rest_of_queens)
    (append rest_of_queens (list (list new_row k))))
(adjoin_position 3 4 (list (list 1 1) (list 3 2) (list 2 3)))
(define (get_row k positions)
    (if (= (car (cdr (car positions))) k)
        (car (car positions))
        (get_row k (cdr positions))))
(get_row 2 (list (list 2 1) (list 3 2) (list 4 3)))
(define (recur? seq k)
    (if (null? (cdr seq))
        false
        (if (= (car seq) k)
            true
            (recur? (cdr seq) k))))
(recur? (list 1 2 3 4) 4)
(define (safe? k positions)
    (define row (get_row k positions))
    (if (= k 1) 
        true
        (if (or (= (+ (get_row (- k 1) positions) 1) row) 
                (= (- (get_row (- k 1) positions) 1) row))
            false
            (not (recur? (map car positions) row)))))
(queens 8)



