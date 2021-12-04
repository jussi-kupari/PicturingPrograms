;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2054) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.5.4
; Develop a function named add-posns that takes in two posns and
; returns a new posn whose x coordinate is the sum of the x coordinates
; of the two inputs, and whose y coordinate is the sum of the y coordinates
; of the two inputs.


;; add-posns : Posn Posn -> Posn
;; Given two Posns, produces a Posn with summed coordinates of the two inputs
(check-expect (add-posns (make-posn 5 7) (make-posn 3 3)) (make-posn 8 10))

(define (add-posns pos1 pos2)
  (make-posn (+ (posn-x pos1) (posn-x pos2))
             (+ (posn-y pos1) (posn-y pos2))))
