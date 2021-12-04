;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1552) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.5.2
; Develop a function named digital-thermometer that takes in a
; temperature (in degrees Fahrenheit) and produces an image of
; the temperature as a number, colored either green (below 99◦),
; yellow (at least 99◦ but less than 101◦) or red (at least 101◦).
; 
; For example,
; .
; 
; Hint: To convert a number to a string, use number->string. However, if you try it
; on a number like 98.6, you may get a fraction rather than a decimal. If you want it in
; decimal form, first make it inexact, using exact->inexact.
; 
; Hint: Use an auxiliary function to choose the color.

(require picturing-programs)

;; Fahrenheit -> Image
;; Given a temperature in F, produces an image of the temperature with color
(check-expect (digital-thermometer 103) (text "103.0" 20 "red"))
(check-expect (digital-thermometer 99.9) (text "99.9" 20 "yellow"))
(check-expect (digital-thermometer 70) (text "70.0" 20 "green"))

(define (digital-thermometer f)
  (cond
    [(>= f 101) (text (number->string (exact->inexact f)) 20 "red")]
    [(> f 99) (text (number->string (exact->inexact f)) 20 "yellow")]
    [else (text (number->string (exact->inexact f)) 20 "green")]))