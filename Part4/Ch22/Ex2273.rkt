;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2273) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.7.3
; Develop a function has-spaces? that takes in a string and tells
; whether it contains any blanks.

;; has-spaces? : String -> Boolean
;; Given a string, produces the true if the string has spaces in it
(check-expect (has-spaces? "") false)
(check-expect (has-spaces? " ") true)
(check-expect (has-spaces? "string") false)
(check-expect (has-spaces? "legends of the fall") true)

(define (has-spaces? str)
  (cond
    [(zero? (string-length str)) false]
    [else (if (equal? " " (substring str 0 1))
              true
              (has-spaces? (substring str 1)))]))

; String to list method

;; -- Data Definitions

;; LOO (ListOfObjects) is one of:
;; - empty
;; - (cons Object LOO)
;; interp. a list of objects

;; has-spaces?.v2 : String -> Boolean
;; Given a string, returns true if the string contains spaces
(check-expect (has-spaces?.v2 "") false)
(check-expect (has-spaces?.v2 " ") true)
(check-expect (has-spaces?.v2 "string") false)
(check-expect (has-spaces?.v2 "legends of the fall") true)

(define (has-spaces?.v2 str)
  (any-matches? #\ (string->list str)))

;; any-matches? : Object LOO -> Boolean
;; Given an object and a LOO, produces true if a matching obejct is found in the list
(check-expect (any-matches? 1 empty) false)
(check-expect (any-matches? 1 (cons 1 empty)) true)
(check-expect (any-matches? "1" (cons "1" empty)) true)
(check-expect (any-matches? 1 (cons 1 (cons 1 (cons 2 empty)))) true)
(check-expect (any-matches? 1 (cons 0 (cons 3 (cons 2 empty)))) false)
(check-expect (any-matches? "1" (cons "0" (cons "3" (cons "2" empty)))) false)

(define (any-matches? obj loo)
  (cond
    [(empty? loo) false]
    [else (if (equal? obj (first loo))
              true
              (any-matches? obj (rest loo)))]))