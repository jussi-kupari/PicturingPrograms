;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1584) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.8.4
; Develop a function named same? that takes in two arguments, each
; of which is either a number or a string, and tells whether they’re “the same”.
; 
; If one is a number and the other a string, they’re obviously not “the same”.
; If both are numbers, you can compare them using = and if both are strings,
; you can compare them using string=?. There’s actually a built-in function
; equal? that does this and more: it compares any two objects, no matter what
; types, to tell whether they’re the same. You may not use it in
; writing Exercise 15.8.4. You may use it in the rest of the book
; (except where I specifically tell you not to), but in most cases it’s a better
; idea to use something more specific like =, string=?, key=?, etc. because
; if you accidentally violate a contract and call one of these on the wrong
; type of input, you’ll get an error message immediately rather than the program
; going on as if everything were OK. Eventually it would probably produce wrong
; answers, which are much harder to track down and fix than error messages.


;; same?: Number|String Number|String -> Boolean
;; Given two arguments (number or string), produces true if they are the same type
(check-expect (same? 0 0) true)
(check-expect (same? 0 1) false)
(check-expect (same? 0 "a") false)
(check-expect (same? "a" "b") false)
(check-expect (same? "a" "a") true)

(define (same? i j)
  (cond
    [(and (number? i) (number? j)) (= i j)]
    [(and (string? i) (string? j)) (string=? i j)]
    [else false]))