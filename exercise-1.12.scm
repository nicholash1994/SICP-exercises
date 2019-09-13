
; n is the power the binomial is raised to
(define (pcoeff k n)
    ; The reason for using >= and <= instead of
    ; simply = is so that the function will simply return 
    ; 1 in the case of invalid input
    ;
    ; If we instead used =, then evaluating, e.g.
    ; (pcoeff 5 2), would loop forever, because
    ; it would call (pcoeff 5 1), (pcoeff 5 0), etc.
    ; and would never terminate.
    (if (or (>= k n) (<= k 1))
        1
        (+ (pcoeff (- k 1) (- n 1)) (pcoeff k (- n 1)))))
