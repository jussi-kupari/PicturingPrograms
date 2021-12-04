;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex772) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.2
; Develop a function named rect-perimeter that takes in the width
; and height of a rectangle, and returns its perimeter.


;; rect-perometer: PositiveNumber PositiveNumber -> PositiveNumber
;; Given width and height of rectangle
;; produce perimeter length

(check-expect (rect-perimeter 0 0) 0)
(check-expect (rect-perimeter 10 10) 40)

(define (rect-perimeter width height)
  (+ (* width 2) (* height 2)))


