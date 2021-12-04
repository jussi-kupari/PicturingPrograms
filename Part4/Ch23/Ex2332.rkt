;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2332) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t quasiquote repeating-decimal #f #t none #f () #t)))

; Practice Exercise 23.3.2
; Translate each of the following lists from nested-cons notation into list notation.
; Check that your answers are correct by typing each expression into DrRacket
; (Beginning Student with List Abbreviations language) and comparing the
; result with your answer.
; 
; (cons "a" empty)
; empty
; (cons 3 (cons 4 (cons -2 empty)))
; (cons (cons 3 empty) empty)


(list "a" empty)
empty
(cons 3 (cons 4 (cons -2 empty)))
(cons (cons 3 empty) empty)
