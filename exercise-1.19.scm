#|

Let T_p'q' = (T_pq)^2

= | (p + q)   q | ^2
  | q         p |

= | ((p + q)^2 + q^2)     ((p + q)q + qp)  |
  | (q(p + q) + pq)        (q^2 + p^2)     |

= | p^2 + 2pq + 2q^2        2pq + q^2      |
  | 2pq + q^2               p^2 + q^2      |

i.e. 
p' = p^2 + q^2
q' = 2pq + q^2

|#

(define (square x) (* x x))

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))      ; compute p'
                   (+ (* 2 p q) (square q))      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
