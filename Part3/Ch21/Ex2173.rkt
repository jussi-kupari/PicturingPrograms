;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2173) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.3
; Define a data type placed-rect to represent a mathematical rectangle
; with its two-dimensional location. It should have a posn for the “top-left corner”
; (a common way of representing rectangles in computer graphics), and two numbers
; for the width and height.

(define-struct placed-rect (corner width height))
;; Placed-rect is a (make placed-rect Posn Natural)
;; interp. a representation of a rectangle with the xy position of the “top-left corner”
;; and width and height of the sides

(define RECT1 (make-placed-rect (make-posn 0 0) 30 40))

#;
(define (fn-for-placed-rect rect)
  (... (fn-for-posn (placed-rect-corner rect))
       (placed-rect-width rect)
       (placed-rect-height rect)))

;; Template rules used:
;;  - compound: 2 fields
;;  - reference: Corner field is Posn