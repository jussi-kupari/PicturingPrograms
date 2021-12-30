;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2422) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.2.2
Develop a function count-down-to that takes in two whole numbers low and high and
produces a list of the numbers high, high-1, . . . low in that order. If low > high,
it should return an empty list. What if we wanted the list in increasing order?
Rather than treating high as a “whole number ≥ low”, and calling the function recursively
on (sub1 high), we instead treat low as a “whole number ≤ high”, and calling the
function recursively on (add1 low).|#

;; -- Functions

;; count-down-to : Natural Natural -> List-Of-Naturals
;; Given two Naturals, produces a list of the Naturals (inc.) in between in high->low order
(check-expect (count-down-to 0 0) (cons 0 empty))
(check-expect (count-down-to 5 4) empty)
(check-expect (count-down-to 3 6) (cons 6 (cons 5 (cons 4 (cons 3 empty)))))

(define (count-down-to l h)
  (cond
    [(> l h) empty]
    [else
     (cons h (count-down-to l (sub1 h)))]))