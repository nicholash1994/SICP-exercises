(define (A x y)
    (cond ((= y 0) 0)
    ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (f n) is defined as (A 0 n), which
; by definition is equal to (* 2 n)

; (A 1 10)
; (A 0 (A 1 9))
; (* 2 (A 1 9))
; (* 2 (A 0 (A 1 8)))
; (* 2 (* 2 (A 1 8)))
; etc.
; (* (expt 2 9) (A 1 1))
; (expt 2 10)
; 1024

; One can use induction to prove that
; (A 1 n) is equal to 2 to the power of n
; for all positive integers n [doesn't hold true
; for n=0]
;
; [base case]
; (A 1 1) is equal to 2 
;
; [inductive step]
; Let n > 1 and suppose that
; (A 1 n) is equal to (expt 2 n),
; by definition (A 1 n) evaluates to
; (A 0 (A 1 (- n 1)))
; which in turn evaluates to
; (* 2 (A 1 (- n 1))). By the inductive hypothesis,
; (A 1 (- n 1)) is equal to (expt 2 (- n 1), so the 
; whole expression is equal to (expt 2 n), proving the 
; inductive step

; Thus (g n) is equal to (expt 2 n)

; (A 2 4)
; (A 1 (A 2 3))
; (expt 2 (A 2 3))
; (expt 2 (A 1 (A 2 2)))
; (expt 2 (expt 2 (A 2 2)))
; etc.
; (expt 2 (expt 2 (expt 2 (A 2 1))))
; (expt 2 (expt 2 (expt 2 2)))

; One can use a similar proof by induction to show that
; (h n) is equal to 2^2^2^2^....^2 {n times}
