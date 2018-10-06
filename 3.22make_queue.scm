(define (make_queue)
    (let ((front_ptr `())
          (rear_ptr `()))
      (define (insert item)
        (let ((new_pair (cons item `())))
            (cond ((emtpy_queue?)
                    (set! front_ptr new_pair)
                    (set! rear_ptr new_pair)
                    front_ptr)
                  (else
                    (set-cdr! rear_ptr new_pair)
                    (set! rear_ptr new_pair)
                    front_ptr))))
      (define (emtpy_queue?)
        (null? front_ptr))
      (define (delete)
        (cond ((emtpy_queue?)
                (error "empty queue!" front_ptr))
              (else
                (set! front_ptr (cdr front_ptr))
                front_ptr)))
      (define (dispatch m)
        (cond ((eq? m `insert)
                (lambda (item)
                    (insert item)))
               ((eq? m `delete)
                 delete)
               (else
                 (error "wrong message" m))))
      dispatch))
(define q1 (make_queue))
((q1 `insert) `a)
((q1 `insert) `b)
((q1 `insert) `c)
((q1 `delete))

