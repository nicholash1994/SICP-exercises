#|

Let x be the golden ration (1 + sqrt(5))/2

Per the hint in the exercise, we'll prove that Fib(n) is the closest integer 
to x^n/sqrt(5) by setting y equal to (1 - sqrt(5))/2, and showing that
Fib(n) = (x^n - y^n)/sqrt(5). This will prove the theorem, because for all n >=
0, |y^n/sqrt(5)| < 1/2. This is because y is less than half, and raising y to a
power greater than 1, will only decrease the absolute value. In the case n=0,
1/sqrt(5) is less than 1/2 since sqrt(5) is greater than 2.
So if it's true that Fib(n) = (x^n - y^n)/sqrt(5) for all n >= 0, then this will
prove the theorem, since that means that the distance between x^n/sqrt(5) and
Fib(n) is less than 1/2, i.e. Fib(n) is the closest integer to x^n/sqrt(5). 

Proof by strong induction:
[base cases; n = 0,1]

If n = 0, x^0 = 1, and y^0 = 1, so (x^0 - y^0)/sqrt(5) = 0 = Fib(0).

If n = 1, (x - y)/sqrt(5) = (1 + sqrt(5) - 1 + sqrt(5))/(2*sqrt(5)) =
2*sqrt(5)/(2*sqrt(5)) = 1 = Fib(1)

[inductive step]

Let n > 1 and suppose that for all positive k < n, x^n - y^n = Fib(n).

Note that y^2 = (1 - sqrt(5))^2/4 = (1 - 2sqrt(5) + 5)/4 = 
6/4 - 2sqrt(5)/4 = 1 + 1/2 - sqrt(5)/2 = 1 + (1 - sqrt(5)/2) = y + 1.
The same holds true for x.

Then Fib(n) = Fib(n - 1) + Fib(n - 2) 
= (x^(n-1) - y^(n-1) + x^(n-2) - y^(n-2))/sqrt(5)
= ((x+1)x^(n-2) - (y+1)y^(n-2))/sqrt(5)
= (x^2x^(n-2) - y^2y^(n-2))/sqrt(5)
= (x^n - y^n)/sqrt(5).

This proves the inductive step, so by strong induction, 
Fib(n) = (x^n - y^n)/sqrt(5) for all n >= 0, which, as proved above, implies
that Fib(n) is the closest integer to x^n/sqrt(5) 

|#
