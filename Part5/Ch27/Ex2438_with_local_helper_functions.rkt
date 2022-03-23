;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2438_with_local_helper_functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.8
Develop a function wn-prime? which tells whether a given whole
number is prime.

Hint: There are several ways to do this. One way is to define a helper function
not-divisible-up-to? which, given two whole numbers m and n, tells whether m is
“not divisible by anything up to n” (except of course 1).
Racket also knows about fractions, but if it didn’t, we could define them ourselves,
just as we’ve defined wholes, addition, multiplication, and so on.|#

;; == wn-prime? with locally defined functions ==

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
  (local [(define (wn-sub m n)
            (cond
              [(zero? n) m]
              [else (wn-sub (sub1 m) (sub1 n))]))
          (define (wn-remainder m n)
            (cond
              [(zero? n) (error "You can't divide with a zero.")]
              [(equal? m n) 0]
              [(< m n) m]
              [else (wn-remainder (wn-sub m n) n)]))
          (define (not-divisible-up-to? m n)
            (cond
              [(equal? n 1) true]
              [(zero? (wn-remainder m n)) false]
              [else (not-divisible-up-to? m (sub1 n))]))]
    (cond
      [(<= n 1) false]
      [else (not-divisible-up-to? n (sub1 n))])))