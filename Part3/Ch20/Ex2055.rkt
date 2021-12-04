;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2055) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.5.5
; Develop a function named sub-posns that takes in two posns and
; returns a new posn whose x coordinate is the difference of the
; x coordinates of the two inputs, and whose y coordinate is the
; difference of the y coordinates of the two inputs.


;; add-posns : Posn Posn -> Posn
;; Given two Posns, produces a Posn with summed coordinates of the two inputs
(check-expect (sub-posns (make-posn 5 7) (make-posn 3 3)) (make-posn 2 4))

(define (sub-posns pos1 pos2)
  (make-posn (- (posn-x pos1) (posn-x pos2))
             (- (posn-y pos1) (posn-y pos2))))
