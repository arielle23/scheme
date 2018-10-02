(define (make_queue) (cons `() `()))
(define (front_ptr queue) (car queue))
(define (rear_ptr queue) (cdr queue))
(define (set_front_ptr! queue item) (set-car! queue item))
(define (set_rear_ptr! queue item) (set-cdr! queue item))
(define (empty_queue? queue) (null? (front_ptr queue)))
(define (front_queue queue)
    (if (empty_queue? queue)
        (error "EMPTY QUEUE" queue)
        (car (front_ptr queue))))
(define (insert_queue! queue item)
    (let ((new_pair (cons item `())))
        (cond ((empty_queue? queue)
                (set_front_ptr! queue new_pair)
                (set_rear_ptr! queue new_pair)
                queue)
              (else
                (set-cdr! (rear_ptr queue) new_pair)
                (set_rear_ptr! queue new_pair)
                queue))))
(define (delete_quue! queue)
    (cond ((empty_queue? queue)
            (error "EMPTY QUEUE" queue))
          (else
            (set_front_ptr! queue (cdr (front_ptr queue)))
            queue)))
(define q1 (make_queue))
; (insert_queue! q1 `a)
; (insert_queue! q1 `b)
(define (print_queue queue)
    (cond ((empty_queue? queue)
            `())
          (else
             (front_ptr queue))))
;(print_queue (insert_queue! q1 `c))
(print_queue q1)