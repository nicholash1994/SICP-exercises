(define (halve n) (/ n 2))
(define (double n) (+ n n))

(define (fast-mult a b)
    (define (iter a b res)
        (cond ((= b 0) res)
              ((= (remainder b 2) 0) (iter (double a) (halve b) res))
              (else (iter a (- b 1) (+ res a)))))
    (iter a b 0))
