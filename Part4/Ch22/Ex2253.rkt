;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2253) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.3
; Suppose you work for a toy company that maintains its inventory as a
; list of strings, and somebody has come into the store looking for a doll.
; You want to know whether there are any in stock. Develop a function contains-doll?
; that takes in a list of strings and tells whether any of the strings in the list is "doll".

;; -- Data Definitions

;; LOS (ListOfStrings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

(define LOS1 empty)
(define LOS2 (cons "a" empty))
(define LOS3 (cons "a" (cons "b" empty)))

;; template
#;
(define (fn-for-los los)
  (cond
    [(empty? los) false]
    [else (... (first los)
               (fn-for-los (rest los)))]))

;; -- Functions

;; contains-doll? : LOS -> Boolean
;; Given LOS, produces true if the LOS contains "doll"
(check-expect (contains-doll? empty) false)
(check-expect (contains-doll? (cons "racket" empty)) false)
(check-expect (contains-doll? (cons "racket" (cons "tin-drum" empty))) false)
(check-expect (contains-doll? (cons "racket" (cons "tin-drum" (cons "doll" empty)))) true)
(check-expect (contains-doll? (cons "doll" (cons "tin-drum" (cons "puppet" empty)))) true)

(define (contains-doll? los)
  (cond
    [(empty? los) false]
    [else (if (string=? (first los) "doll")
              true
              (contains-doll? (rest los)))]))