;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2419) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.9
Develop a function fibonacci that takes in a whole number n and
produces the n-th Fibonacci number. The Fibonacci numbers are defined as follows: the
0-th Fibonacci number is 0, the 1st Fibonacci number is 1, and each subsequent Fibonacci
number is the sum of the previous two Fibonacci numbers. For example,

(check-expect (fibonacci 0) 0)
(check-expect (fibonacci 1) 1)
(check-expect (fibonacci 2) 1)
(check-expect (fibonacci 3) 2)
(check-expect (fibonacci 4) 3)
(check-expect (fibonacci 5) 5)
(check-expect (fibonacci 6) 8)
(check-expect (fibonacci 7) 13)

Hint: The usual template involves calling (fibonacci (- n 1)) inside the body of
fibonacci. In this case, you’ll probably want to call (fibonacci (- n 2)) as well.
However, that doesn’t make sense unless you know that (- n 2) is a whole number, so
your base case needs to handle both 0 and 1.
Note: The definition of fibonacci that you get by following the template for whole
numbers is correct, but extremely slow. On my computer, (fibonacci 30) takes about
a second; (fibonacci 35) takes about ten seconds; and (fibonacci 37) takes almost
thirty seconds. Try watching it in the Stepper, and you’ll see that it asks the same
question over and over. See if you can find a way to solve the same problem much more
efficiently, using a helper function with some extra parameters. We’ll see another way to
fix this problem in Section 30.3.
|#

;; fibonacci : Natural -> Natural
;; produces the nth (of given Natural) fibonacci
(check-expect (fibonacci 0) 0)
(check-expect (fibonacci 1) 1)
(check-expect (fibonacci 2) 1)
(check-expect (fibonacci 3) 2)
(check-expect (fibonacci 4) 3)
(check-expect (fibonacci 5) 5)
(check-expect (fibonacci 6) 8)
(check-expect (fibonacci 7) 13)

(define (fibonacci n)
  (cond
    [(zero? n) 0]
    [(= 1 n) 1]
    [else
     (+ (fibonacci (- n 1))
        (fibonacci (- n 2)))]))