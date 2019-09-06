(define (maxss a b c)
    (if (and (>= a c) (>= b c))
        (+ (* a a) (* b b))
        (maxss c a b)))
