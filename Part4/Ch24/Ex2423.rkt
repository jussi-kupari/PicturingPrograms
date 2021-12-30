;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2423) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.2.3
Develop a function count-up-to that takes in two whole numbers
low and high and produces a list of the numbers low, low+1, . . . high. If low > high,
it should return an empty list.|#

;; count-up-to : Natural Natural -> LONa
;; Given two Naturals, produces a list of the numbers (inc.) in between in low->high order
(check-expect (count-up-to 5 4) empty)
(check-expect (count-up-to 0 0) (cons 0 empty))
(check-expect (count-up-to 4 5) (cons 4 (cons 5 empty)))
(check-expect (count-up-to 3 6) (cons 3 (cons 4 (cons 5 (cons 6 empty)))))

(define (count-up-to l h)
  (cond
    [(> l h) empty]
    [else
     (cons l (count-up-to (add1 l) h))]))