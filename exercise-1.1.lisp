10
; 10
(+ 5 3 4)
; 12
(- 9 1)
; 8
(/ 6 2)
; 3
(+ (* 2 4) (- 4 6))
; (+ 8 -2)
; 6
(define a 3)
; a
(define b (+ a 1))
; b
(+ a b (* a b))
; (+ 3 4 (* 3 4))
; (+ 7 12)
; 19
(= a b)
; #f
(if (and (> b a) (< b (* a b)))
    b
    a)
; (if (and (> 4 3) (< 4 (* 3 4)))
;      4
;      3)
; (if (and #t #t) 4 3)
; (if #t 4 3)
; 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; (+ 6 7 3)
; 16
(+ 2 (if (> b a) b a))
; (+ 2 (if (> 4 3) 4 3))
; (+ 2 (if #t 4 3))
; (+ 2 4)
; 6
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; (* 4 (+ 3 1))
; (* 4 4)
; 16
