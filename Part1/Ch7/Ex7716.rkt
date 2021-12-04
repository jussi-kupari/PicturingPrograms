;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7716) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.16
; Develop a function named fahrenheit->celsius that takes in a
; temperature measurement in Fahrenheit, and returns the corresponding temperature in
; Celsius.
; 
; Hint: The conversion formula is C = (F − 32) · 5/9.


;; fahrenheit->celcius: Number -> Number
;; Given Fahrenheit degrees
;; produce the temperature in Celcius degrees

(check-within (fahrenheit->celcius 100) 37.7 0.1)
(check-within (fahrenheit->celcius 0) -17.7 0.1)

(define (fahrenheit->celcius f)
  (* (- f 32) 5/9))