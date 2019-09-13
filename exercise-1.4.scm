(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This procedure simply evaluates to 
; (+ a b) if b is greater than 0,
; and (- a b) if b is less than or 
; equal to 0. Since operators can themselves
; be combinations, (if (> b 0) + -) returns
; + or - depending on the sign of b. Then
; either (+ a b) or (- a b) is evaluated.
; This procedure is obviously just equal to 
; a plus the absolute value of b. 
