;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1535) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.3.5
; Develop a function smallest-of-3 that takes in three numbers and
; returns the smallest of them. There is a built-in function min which
; does this job for you. For this exercise, use conditionals, not min
; or anything like it.


;; Number Number Number -> Number
;; Given three numbers, produces the smallest of them
(check-expect (smallest-of-3 1 2 3) 1)
(check-expect (smallest-of-3 1 2 2) 1)
(check-expect (smallest-of-3 1 0 6) 0)
(check-expect (smallest-of-3 2 2 2) "no single number is smallest")

(define (smallest-of-3 n1 n2 n3)
  (cond[(and (< n1 n2)
             (< n1 n3)) n1]
       [(and (< n2 n1)
             (< n2 n3)) n2]
       [(and (< n3 n1)
             (< n3 n2)) n3]
       [else "no single number is smallest"]))