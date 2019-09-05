(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; This function doesn't work because new-if, being a
; normal function and not a special form, evaluates all
; its arguments before returning a result. Thus, since the 
; alternative of the if statement (the combination to be 
; evaluated if the predicate is false) calls sqrt-iter, the program
; gets stuck in an infinite loop. The original definition only 
; works because "if" is a special form, and the alternative combination
; is only evaluated if the predicate is false.
