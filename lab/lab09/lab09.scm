(define (over-or-under num1 num2) 
(cond 
  ((< num1 num2) -1)
  ((= num1 num2) 0)
  (else 1)
)
)

(define (make-adder num) 
(lambda (inc)
  (+ num inc)
)
)

(define (composed f g) 
(lambda (x)
  (f (g x))
)
)

(define (repeat f n) 
  (define (helper x)
    (if (= n 1)
    (f x)
    ((composed f (repeat f (- n 1))) x)
    )
  ) 
  helper
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  (define x (max a b))
  (define y (min a b))
  (cond
    ((= y 0) x)
    ((= (modulo x y) 0) y)
    (else (gcd y (modulo x y))) 
  )
)
