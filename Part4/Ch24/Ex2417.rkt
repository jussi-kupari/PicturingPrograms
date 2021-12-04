;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2417) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.7
Develop a function add-up-to that takes in a whole number and
returns the sum of all the whole numbers up to and including it.

Hint: The formula n(n+1)/2 solves the same problem, so you can use it to check your
answers. But you should write your function by actually adding up all the numbers, not
by using this formula.|#

;; add-up-to : Natural -> Natural
;; Given a Natural, produces the sum of all the numbers up to if from zero
(check-expect (count-up-to 0) 0)
(check-expect (count-up-to 1) (+ 1 0))
(check-expect (count-up-to 2) (+ 2 1 0))
(check-expect (count-up-to 3) (+ 3 2 1 0))

(define (count-up-to n)
  (cond
    [(zero? n) 0]
    [else
     (+ n (count-up-to (sub1 n)))]))