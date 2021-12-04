;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1585) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.8.5
; Develop a function named smart-add that takes two parameters and adds them.
; The trick is that the parameters can be either numbers (like 17) or strings of
; digits (like "17"). Your function has to be able to handle both.
; 
; Hint: There are two parameters, each of which could be either of two types, so you’ll
; need at least four examples.


;; smart-add: Number|String Number|String -> Number
;; Given two parameters that can be numbers or numbers as strings
;; produce their addition
(check-expect (smart-add 1 1) 2)
(check-expect (smart-add 1 "1") 2)
(check-expect (smart-add "1" 1) 2)
(check-expect (smart-add "1" "1") 2)

(define (smart-add i j)
  (cond
    [(and (number? i) (number? j)) (+ i j)]
    [(and (number? i) (string? j)) (+ i (string->number j))]
    [(and (string? i) (number? j)) (+ j (string->number i))]
    [(and (string? i) (string? j)) (+ (string->number i) (string->number j))]))