;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2331) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Practice Exercise 23.3.1
; Translate each of the following lists from list notation into nested-cons notation.
; Check that your answers are correct by typing each expression into DrRacket
; (Beginning Student language) and comparing the result with your answer.

; (list)
; (list "a")
; (list "a" "b")
; (list (list "Mary" "Joe") (list "Chris" "Phil"))
; (list empty "a" empty)

empty
(cons "a" empty)
(cons "a" (cons "b" empty))
(cons (cons "Mary" (cons "Joe" empty)) (cons (cons "Chris" (cons "Phil" empty)) empty))
(cons empty (cons "a" (cons empty empty)))