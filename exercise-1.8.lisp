(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cbrt-iter guess prev-guess x)
    (if (good-enough? guess prev-guess x)
        guess
        (cbrt-iter (improve guess x) guess x)))

(define (good-enough? guess prev-guess x)
    (< (abs (/ (- guess prev-guess) guess)) 0.001)

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 y)) 3))

(define (cbrt x) (cbrt-iter 1.0 0.0 x))
