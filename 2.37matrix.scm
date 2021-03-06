(define (accumulate op init sequence)
    (if (null? sequence)
        init
        (op (car sequence)
            (accumulate op init (cdr sequence)))))
(define (accumulate_n op init seqs)
    (if (null? (car seqs))
        `()
        (cons (accumulate op init (map car seqs))
              (accumulate_n op init (map cdr seqs)))))
(define (dot_product v w)
    (accumulate + 0 (map * v w)))

(define (matrix_*_vector m v)
    (map (lambda (x) 
                 (dot_product x v))
         m))
(matrix_*_vector (list (list 1 2 3) 
                       (list 2 3 4) 
                       (list 4 5 6))
                                     (list 5 6 7))

(define (transpose mat)
    (accumulate_n cons `() mat))
(define m (list (list 1 2 3) 
                (list 2 3 4) 
                (list 4 5 6)))
(define n (list (list 2 3 4)
                (list 3 4 5)
                (list 4 5 6)))
(define (matrix_*_matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (m_v)
                (map (lambda (col_v)
                        (dot_product col_v m_v))
                      cols))
              m)))
(matrix_*_matrix m n)