(define (make_monitored proc)
    (let ((call 0))
        (lambda (input)
            (cond ((eq? input `how-many-calls)
                    call)
                  ((eq? input `reset)
                    (set! call 0))
                  (else
                    (begin (set! call (+ call 1))
                            (proc input)))))))
(define s (make_monitored sqrt))

(s 100)

(s `how-many-calls)