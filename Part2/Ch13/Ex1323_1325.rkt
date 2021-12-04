;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1323_1325) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 13.2.3
; Develop a function is-nintendo? that takes in a string and tells
; whether it was "nintendo".
; 
; Exercise 13.2.4
; Develop a function empty-string? that takes in a string and tells
; whether it was "".
; 
; Exercise 13.2.5
; Develop a function in-first-half? that takes in a (lower-case)
; string and tells whether it’s in the first half of the alphabet
; (i.e. it comes before "n" in alphabetical order)
; 
; Hint: You’ll need at least two examples: one in the first half
; of the alphabet, and one in the second half. It’s also a good
; idea to have an example that’s "n" itself. This is called a
; borderline example. What do you think is the “right answer”
; for this example?



;Ex13.2.3
;; String -> Boolean
;; Given string, produces true if it is "nintendo"
(check-expect (is-nintendo? "") false)
(check-expect (is-nintendo? "abc") false)
(check-expect (is-nintendo? "nintendo") true)

(define (is-nintendo? s)
  (string=? s "nintendo"))

;Ex13.2.4
;; String -> Boolean
;; Given string, produces true if the string is empty
(check-expect (empty-string? "") true)
(check-expect (empty-string? "abc") false)

(define (empty-string? s)
  (string=? s ""))

;Ex 13.2.5
;; String -> Boolean
;; Given a string in lower-case, produces true if it is smaller than "n"
(check-expect (in-first-half? "ddavid") true)
(check-expect (in-first-half? "oouch") false)
(check-expect (in-first-half? "nano") false)
(check-expect (in-first-half? "nnn") false)
(check-expect (in-first-half? "n") false)

(define (in-first-half? s)
  (string<? s "n"))