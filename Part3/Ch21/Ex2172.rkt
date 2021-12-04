;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2172) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.2
; Define a data type placed-circ to represent a mathematical circle with
; its two-dimensional location. It should have a posn for its center, and
; a number for its radius.


(define-struct placed-circ (center radius))
;; Placed-circ is a (make placed-circ Posn Natural)
;; interp. a representation of a circle with the xy position of the center and radius

(define CIRCLE1 (make-placed-circ (make-posn 50 50) 30))

#;
(define (fn-for-placed-circ c)
  (... (fn-for-posn (placed-circ-center c))
       (placed-circ-radius c)))

;; Template rules used:
;;  - compound: 2 fields
;;  - reference: center field is Posn

