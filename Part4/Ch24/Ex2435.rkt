;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2435) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.5
Develop a function wn=? which, given two whole numbers m and n,
tells whether they’re equal or not.|#

;; wn= : Natural Natural -> Boolean
;; Given two naturals, produces true if they are equal
(check-expect (wn=? 0 0)  true)
(check-expect (wn=? 1 0) false)
(check-expect (wn=? 1 1)  true)
(check-expect (wn=? 7 2) false)
(check-expect (wn=? 7 9) false)

(define (wn=? m n)
  (cond
    [(and (zero? m) (zero? n)) true]
    [(and (positive? m) (zero? n)) false]
    [(and (zero? m) (positive? n)) false]
    [else (wn=? (sub1 m) (sub1 n))]))