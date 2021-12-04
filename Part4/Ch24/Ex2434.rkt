;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2434) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.4
Develop a function wn<=? which, given two whole numbers m and n,
tells whether m ≤ n.|#

;; wn<=? : Natural Natural -> Boolean
;; Given two naturals, produces true if the first is smaller or equal to second
(check-expect (wn<=?    0    0) true)
(check-expect (wn<=?    0    1) true)
(check-expect (wn<=?    3    7) true)
(check-expect (wn<=?    1    1) true)
(check-expect (wn<=? 1234 1234) true)
(check-expect (wn<=?    1    0) false)
(check-expect (wn<=?   17    4) false)

(define (wn<=? m n)
  (cond
    [(and (positive? m) (zero? n)) false]
    [(and (or (positive? n) (zero? n)) (zero? m)) true]
    [else (wn<=? (sub1 m) (sub1 n))]))