;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24310) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.10
Develop a function frac=? that takes in two frac objects and tells
whether they’re equal.

Careful! What does it mean for two fractions to be equal?

Answer:
We can use the cross-products of the fractions to test for equality.
Cross-products of two equal fractions should produce equal numbers.
|#

(define-struct frac (numerator denominator))
;; Frac is (make-frac Natural Natural)
;; interp. a fraction of numerator over denominator 

(define FRAC1 (make-frac 6 10))

#| Template for frac
(define (fn-for-frac f)
  (... (frac-numerator f)       
       (frac-denominator f)))   
|#

;; frac=? : Frac Frac -> Boolean
;; Given two fractions, produces true if they are equal
(check-expect (frac=? (make-frac  1  3) (make-frac   2  4)) false)
(check-expect (frac=? (make-frac  1  3) (make-frac   3  9)) true)
(check-expect (frac=? (make-frac  5  6) (make-frac   3  9)) false)
(check-expect (frac=? (make-frac  5  6) (make-frac  30 36)) true)

(define (frac=? f1 f2)
  (equal? (wn-mult (frac-numerator f1) (frac-denominator f2))
          (wn-mult (frac-numerator f2) (frac-denominator f1))))

;; wn-mult : Natural Natural -> Natural
;; Given two natural numbers, produces their product
(check-expect (wn-mult 0  0)  0)
(check-expect (wn-mult 1  0)  0)
(check-expect (wn-mult 0  1)  0)
(check-expect (wn-mult 1  1)  1)
(check-expect (wn-mult 1  1)  1)
(check-expect (wn-mult 2  1)  2)
(check-expect (wn-mult 1  2)  2)
(check-expect (wn-mult 2  2)  4)
(check-expect (wn-mult 2  3)  6)
(check-expect (wn-mult 3  5) 15)
(check-expect (wn-mult 7  7) 49)
(check-expect (wn-mult 8 10) 80)

(define (wn-mult m n)
  (cond
    [(or (zero? m) (zero? n)) 0]
    [else (wn-add m (wn-mult m (sub1 n)))]))

;; wn-add : Natural Natural -> Natural
;; Given two naural numbers, produces their sum
(check-expect (wn-add 0 0) 0)
(check-expect (wn-add 0 1) 1)
(check-expect (wn-add 0 3) 3)
(check-expect (wn-add 1 0) 1)
(check-expect (wn-add 3 0) 3)
(check-expect (wn-add 3 8) 11)

(define (wn-add m n)
  (cond
    [(zero? n) m]
    [else (wn-add (add1 m) (sub1 n))]))