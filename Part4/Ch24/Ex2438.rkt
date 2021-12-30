;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2438) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.8
Develop a function wn-prime? which tells whether a given whole
number is prime.

Hint: There are several ways to do this. One way is to define a helper function
not-divisible-up-to? which, given two whole numbers m and n, tells whether m is
“not divisible by anything up to n” (except of course 1).
Racket also knows about fractions, but if it didn’t, we could define them ourselves,
just as we’ve defined wholes, addition, multiplication, and so on.|#

;; wn-prime? : Natural -> Boolean
;; Given a natural, produces true if it is a prime number
(check-expect (wn-prime?  0) false)
(check-expect (wn-prime?  1) false)
(check-expect (wn-prime?  2) true)
(check-expect (wn-prime?  3) true)
(check-expect (wn-prime?  4) false)
(check-expect (wn-prime?  5) true)
(check-expect (wn-prime?  6) false)
(check-expect (wn-prime?  7) true)
(check-expect (wn-prime? 19) true)
(check-expect (wn-prime? 23) true)
(check-expect (wn-prime? 30) false)
(check-expect (wn-prime? 88) false)
(check-expect (wn-prime? 89) true)

(define (wn-prime? n)
  (cond
    [(<= n 1) false]
    [else (not-divisible-up-to? n (sub1 n))]))

;; not-divisible-up-to? : Natural Natural -> Boolean
;; Given two naturals, produces true if first is not divisible with any natural up to the second
(check-expect (not-divisible-up-to? 2 1) true)
(check-expect (not-divisible-up-to? 5 4) true)
(check-expect (not-divisible-up-to? 6 5) false)

(define (not-divisible-up-to? m n)
  (cond
    [(equal? n 1) true]
    [(zero? (wn-remainder m n)) false]
    [else (not-divisible-up-to? m (sub1 n))]))

;; wn-remainder : Natural Natural -> Natural
;; Given two naturals, produces the remainder of dividing the first with the second.
(check-error  (wn-remainder 0 0) "You can't divide with a zero.")
(check-error  (wn-remainder 1 0) "You can't divide with a zero.")
(check-expect (wn-remainder 0 1) 0)
(check-expect (wn-remainder 0 5) 0)
(check-expect (wn-remainder 5 5) 0)
(check-expect (wn-remainder 6 5) 1)
(check-expect (wn-remainder 5 6) 5)
(check-expect (wn-remainder 9 5) 4)

(define (wn-remainder m n)
  (cond
    [(zero? n) (error "You can't divide with a zero.")]
    [(equal? m n) 0]
    [(< m n) m]
    [else (wn-remainder (wn-sub m n) n)]))

;; wn-sub : Natural Natural -> Integer
;; Given two naturals, produces their difference
(check-expect (wn-sub  0  0)   0)
(check-expect (wn-sub  1  0)   1)
(check-expect (wn-sub  1  1)   0)
(check-expect (wn-sub  0  1)  -1)
(check-expect (wn-sub 20 17)   3)
(check-expect (wn-sub 17 20)  -3)

(define (wn-sub m n)
  (cond
    [(zero? n) m]
    [else (wn-sub (sub1 m) (sub1 n))]))    