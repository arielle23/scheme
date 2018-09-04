(define (accumulate op init sequence)
    (if (null? sequence)
        init
        (op (car sequence)
            (accumulate op init (cdr sequence)))))
(define (enumerate_interval low high)
    (if (> low high)
        `()
        (cons low (enumerate_interval (+ low 1 ) high))))

(define (flatmap proc sequence)
    (accumulate append `() (map proc sequence)))

(define (get_pairs n s)
    (filter (lambda (pair)
                    (= s
                       (accumulate + 0 pair)))
            (flatmap (lambda (i)
                             (flatmap (lambda (j)
                                              (map (lambda (k) (list i j k))
                                                   (enumerate_interval (+ j 1) n)))
                                      (enumerate_interval (+ i 1) n)))
                     (enumerate_interval 1 n))))
(get_pairs 10 8)

