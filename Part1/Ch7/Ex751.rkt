;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex751) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.5.1
; Write a Racket expression to represent the standard arithmetic
; expression (sqrt(4 + (2 * 3))) .. Be sure to write a test case!
; Hint: The answer should come out close to 3.162.

(check-within
 (sqrt (+ 4 (* 2 3))) 3.162 0.01)

(sqrt (+ 4 (* 2 3)))


