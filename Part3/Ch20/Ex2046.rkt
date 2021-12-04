;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2046) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.4.6
; Develop a function named posn=? that takes in two posns and tells
; whether they’re the same (i.e. they have the same x coordinate and
; the same y coordinate).
; 
; Hint: Be sure your examples include two posns that are the same,
; two that differ only in x, two that differ only in y, and two that
; differ in both x and y coordinates. You may not use the built-in equal?
; function to solve this problem


;; posn=? : Posn Posn -> Boolean
;; Given two positions, produces true if they have identical x and y coordinates
(check-expect (posn=? (make-posn 0 0) (make-posn 0 0)) true)
(check-expect (posn=? (make-posn 0 0) (make-posn 5 5)) false)
(check-expect (posn=? (make-posn 54 23) (make-posn 12 354)) false)
(check-expect (posn=? (make-posn 35 56) (make-posn 35 56)) true)

(define (posn=? pos1 pos2)
  (and
    (= (posn-x pos1) (posn-x pos2))
    (= (posn-y pos1) (posn-y pos2))))