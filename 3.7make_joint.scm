(define (Invalid_password m)
    "invalid password")
 (define (Invalid_password m)
        "invalid password")(define (make_account balance)
    (define (call_the_cops m)
        "call the cops")
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                    balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (dispatch password message)
        (if (eq? password `secret_password)
            (cond ((eq? message `withdraw) withdraw)
                  ((eq? message `deposit) deposit)
                  (else
                    (error "Unknown request -- MAKE_ACCOUNT" m)))
            Invalid_password))
    dispatch)
(define peter_acc (make_account 100))
(define (make_joint account old_password new_password)
    (lambda (password op)
        (if (eq? old_password `secret_password)
            (if (eq? password new_password)
                (account old_password op)
                (Invalid_password))
            "fail to make joint")))
(define paul_acc (make_joint peter_acc `secret_password `new_password))
((paul_acc `new_password `withdraw) 20)
((peter_acc `secret_password `withdraw) 20)
