;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2052) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.5.2
; Develop a function named swap-x-y that takes in a posn and returns
; a new posn with the coordinates swapped: the x coordinate of the output
; should be the y coordinate of the input, and vice versa.
; 
; Hint: This function both takes in and returns a posn, but they’re not the same posn,
; so you’ll need to use both the input and output templates for posn.


;; swap-x-y : Posn -> Posn
;; Given a Posn, produces a Posn with the x and y swapped
(check-expect (swap-x-y (make-posn 15 12)) (make-posn 12 15))

(define (swap-x-y pos)
  (make-posn (posn-y pos) (posn-x pos)))
