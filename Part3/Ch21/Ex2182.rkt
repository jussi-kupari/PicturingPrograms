;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2182) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.2 Develop a function area which works on a placed-shape and returns
; the area of the shape.


;; -- Data Definitions

(define-struct placed-circ (center radius))
;; Placed-circ is a (make placed-circ Posn Natural)
;; interp. a representation of a circle with the xy position of the center and radius


(define-struct placed-rect (corner width height))
;; Placed-rect is a (make placed-rect Posn Natural)
;; interp. a representation of a rectangle with the xy position of the “top-left corner”
;; and width and height of the sides

;; Placed-shape is one of:
;; - Placed-circ
;; - Placed-rect


;; -- Functions

;; area : Placed-shape -> Number
;; Given a placed-shape, produces the area
(check-expect (area (make-placed-circ (make-posn 10 10) 0)) 0)
(check-expect (area (make-placed-circ (make-posn 10 10) 10)) (inexact->exact (* pi (sqr 10))))
(check-expect (area (make-placed-rect (make-posn 10 10) 0 0)) 0)
(check-expect (area (make-placed-rect (make-posn 10 10) 10 10)) 100)

(define (area ps)
  (cond
    [(placed-circ? ps)
     (inexact->exact(* pi (sqr (placed-circ-radius ps))))]
    [(placed-rect? ps)
     (* (placed-rect-width ps) (placed-rect-height ps))]))