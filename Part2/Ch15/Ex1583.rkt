;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1583) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.8.3
; Define a function named big? that takes in either a number or a
; string, and tells whether the argument is “big”.
; 
; What does “big” mean?
; 
; For numbers, let’s say it means at least 1000, and for strings,
; let’s say it’s any string of length 10 or more.
; 
; Hint: The function needs to handle two kinds of input, and for
; each kind of input there are two possible answers and a “borderline”,
; so you’ll need six test cases.


;; big?: Number|String -> Boolean
;; Given a number or a string
;; produces true if the number is > 1000 or string is longer than 10
(check-expect (big? 999) false)
(check-expect (big? 1000) true)
(check-expect (big? "string") false)
(check-expect (big? "long-sring") true)

(define (big? i)
  (cond
    [(number? i) (>= i 1000)]
    [(string? i) (>= (string-length i) 10)]))