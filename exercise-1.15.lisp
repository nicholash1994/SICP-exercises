(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

#|

a. 
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.3499999999999999)))
(p (p (p (sine 0.44999999999999996))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))

Thus p is called five times.

b.

The order of growth of (sine a) as a function of a is log(a), since 
every time a triples, p only needs to be called one more time, so the number 
of times p is called grows linearly as a increases exponentially, i.e.

3^n ~= a

which implies that

n = log_3(a) where n is the number of times p is called.

|#
