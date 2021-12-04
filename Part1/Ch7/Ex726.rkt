;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex726) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Exercise 7.2.6 Write an expression in the definitions pane to represent the “stan-
; dard” algebraic expression (quadratic equation formula)
; 
; .
; 
; Test your expression by defining a to be 1, b to be -2, and c to be -3; the answer should
; be 3.
; Test your expression again by defining the variables with different values, and predicting
; what the right answer should be.


(define a 1)
(define b -2)
(define c -3)


(check-expect (/ (+ (* b -1) (sqrt (- (sqr b) (* 4 a c))))
   (* 2 a)) 3)