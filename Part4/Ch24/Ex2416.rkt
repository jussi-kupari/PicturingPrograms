;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ex 2416|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.6
Develop a function count-down that takes in an (ordinary) whole
number and produces a list of the whole numbers from it down to 0. For example,
(check-expect (count-down 4) (list 4 3 2 1 0))|#

;; -- Data Definition

;; LONa (List-of-Naturals) is one of:
;; - 0
;; (add1 Natural LONa)
;; interp. a list of Natural numbers


;; -- Functions

;; count-down : Natural -> LONa
;; Given a Natural, produces a list of whole number down to 0
(check-expect (count-down 0) empty)
(check-expect (count-down 1) (cons 1 empty))
(check-expect (count-down 2) (cons 2 (cons 1 empty)))
(check-expect (count-down 3) (cons 3 (cons 2 (cons 1 empty))))

(define (count-down n)
  (cond
    [(zero? n) empty]
    [else
     (cons n (count-down (sub1 n)))]))