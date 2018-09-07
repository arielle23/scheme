(define (exponential? x)
    (and (pair? x) (eq? (car x) `**)))
(define (base x)
    (cadr x))
(define (exponential x)
    (caddr x))
(define (make_exponential base exp)
    (cond ((=number? exp 0) 1)
          ((and (number? base) (number? exp)) (expt base exp))
          (else
            (list `** base exp))))

(define variable? symbol?)
(define (same_variable? x y)
    (and (variable? x) (variable? y) (eq? x y)))
(define (=number? x num)
    (and (number? x) (= x num)))

(define (sum? x)
    (and (pair? x) (eq? (car x) `+)))
(define (make_sum x y)
    (cond ((=number? x 0) y)
          ((=number? y 0) x)
          ((and (number? x) (number? y)) (+ x y))
          (else
            (list `+ x y))))
(define (augend x)
    (caddr x))
(define (addend x)
    (cadr x))

(define (product? x)
    (and (pair? x) (eq? (car x) `*)))
(define (make_product x y)
    (cond ((or (=number? x 0) (=number? y 0)) 0)
          ((=number? x 1) y)
          ((=number? y 1) x)
          ((and (number? x) (number? y)) (* x y))
          (else
            (list `* x y))))
(define (multipliand x)
    (caddr x))
(define (multiplier x)
    (cadr x))

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
            (if (same_variable? exp var) 1 0))
          ((sum? exp)
            (make_sum (deriv (addend exp) var)
                      (deriv (augend exp) var)))
          ((product? exp)
            (make_sum
                (make_product (multiplier exp)
                              (deriv (multipliand exp) var))
                (make_product (deriv (multiplier exp) var)
                              (multipliand exp))))
          ((exponential? exp)
            (make_product
                (make_product
                    (exponential exp)
                    (make_exponential
                        (base exp)
                        (- (exponential exp) 1)))
                (deriv (base exp) var)))
          (else
            (error "unknown expression type" exp))))

