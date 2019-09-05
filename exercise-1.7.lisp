(define (square x) (* x x))

; Original definition of good enough
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x) (sqrt-iter 1.0 x))

; This version of the sqrt function doesn't perform well
; with numbers which are very large or very small. The reason
; has to do with how the good-enough function is implemented. 
; If y is the current estimate of the square root of x, then
; the estimate is considered good enough if (abs (- (square y) x))
; is smaller than some predetermined range, e.g. 0.001.

; In the case of small numbers, the problem is that even poor guesses
; would be considered good enough. For example, evaluating (sqrt 0.00000000001),
; on my machine at least, yields .0312500001065625, even though evaluating 
; (square .0312500001065625) yields 9.765625066601564e-4, which isn't close to 
; 0.00000000001 at all.

; In the case of large floating-point numbers, since they're generally represented with
; limited precision, there might not even be a representable number which is
; good enough. For example, suppose that floating-point numbers are represented
; with only a fixed number of significant digits. Then as the numbers get
; larger, the gaps between representable floating point numbers get larger and
; larger, and so (sqrt x) might loop forever if x is sufficiently large.

; If we're using an interpreter which can support arbitrary-precision
; then our sqrt procedure should eventually return a result, but it'll take 
; a fairly long time, making our sqrt procedure unsuitable for large numbers
; even if our interpreter supports arbitrary-precision arithmetic.

; However, if we modify our sqrt procedure, we can do better. If
; we define it as follows:

(define (new-good-enough? guess prev-guess)
    (< (abs (/ (- guess prev-guess) guess)) 0.001))

(define (new-sqrt-iter guess prev-guess x)
  (if (new-good-enough? guess prev-guess)
      guess
      (new-sqrt-iter (improve guess x) guess
                 x)))

(define (new-sqrt x) (new-sqrt-iter 1.0 0.0 x))

; This new method checks to see if the difference between the 
; previous guess and the current guess is a small fraction of the 
; current guess. On my machine, this function quickly returns a good 
; approximation square roots even for very large and small numbers.
; For example:

#|

1 ]=> (new-sqrt 56718235678123671823)

;Value: 7531151198.237768

1 ]=> (square 7531151198.237768)

;Value: 5.671823837071817e19

1 ]=> (new-sqrt 0.00000000000000001)

;Value: 3.162277660178471e-9

1 ]=> (square 3.162277660178471e-9)

;Value: 1.0000000000063826e-17

|#

; Thus, the new square root function works much better for
; very large and very small numbers
