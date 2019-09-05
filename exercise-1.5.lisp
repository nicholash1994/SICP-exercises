(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; (test 0 (p))

; This test above (commented out) will fail for interpreters that use 
; applicative order evaluation. The reason is that (p) simply recursively
; evaluates to (p), so any applicative-order interpreter (i.e. one that
; evaluates the arguments of a combination before the operator) will
; get stuck in an infinite loop.

; In the case of a normal-order interpreter, however, the test will return 0,
; since (test 0 (p)) will first expand out to 
; (if (= x 0) 0 (p))
; (if (= 0 0) 0 (p))
; (if #t 0 (p))
; 0
; This doesn't get stuck in a loop because the combination (p) is simply
; never evaluated. 
