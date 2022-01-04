;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2181) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 21.8.1
; Define a data type named placed-shape which is either a placed-circ (from Exercise 21.7.2)
; or a placed-rect (from Exercise 21.7.3). Develop a function perimeter which works on a placed-shape
; and returns the length of the boundary of the shape. Develop a function move-shape that takes in
; a placed-shape and two numbers dx and dy, and returns another placed-shape just like the given
; one but moved by dx in the x dimension and dy in the y dimension.

;; -- Data Definitions

(define-struct placed-circ (center radius))
;; Placed-circ is a (make placed-circ Posn Natural)
;; interp. a representation of a circle with the xy position of the center and radius

;; example
(define CIRCLE1 (make-placed-circ (make-posn 50 50) 30))

(define-struct placed-rect (corner width height))
;; Placed-rect is a (make placed-rect Posn Natural)
;; interp. a representation of a rectangle with the xy position of the “top-left corner”
;; and width and height of the sides

;; example
(define RECT1 (make-placed-rect (make-posn 0 0) 30 40))

;; Placed-shape is one of:
;; - Placed-circ
;; - Placed-rect

;; -- Functions

;; perimeter : Placed-shape -> Number
;; Given a placed-shape, produces the length of perimeter (pixels)
(check-within (perimeter (make-placed-circ 10 10)) (* 2 pi 10) 0.1)
(check-expect (perimeter (make-placed-rect 10 5 4)) (* (+ 5 4) 2))

(define (perimeter ps)
  (if (placed-circ? ps)
      (* 2 pi (placed-circ-radius ps))
      (* (+ (placed-rect-width ps) (placed-rect-height ps)) 2)))

;; move-shape : Placed-shape Number Number -> Placed-shape
;; Given a placed-shape and dx dy, produces a new placed-shape moved dx and dy in the coordinates
(check-expect (move-shape CIRCLE1 0 0) CIRCLE1)
(check-expect (move-shape CIRCLE1 5 5) (make-placed-circ (make-posn 55 55) 30))
(check-expect (move-shape CIRCLE1 5 -5) (make-placed-circ (make-posn 55 45) 30))
(check-expect (move-shape RECT1 0 0) RECT1)
(check-expect (move-shape RECT1 5 5) (make-placed-rect (make-posn 5 5) 30 40))
(check-expect (move-shape RECT1 5 -5) (make-placed-rect (make-posn 5 -5) 30 40))

(define (move-shape ps dx dy)
  (cond
    [(placed-circ? ps) (move-circle ps dx dy)]
    [else (move-rect ps dx dy)]))

;; move-circle : Placed-circ Number Number -> Placed-circ
;; Given a placed-circle and dx dy, produces a new placed-circle moved dx and dy in the coordinates
(check-expect
 (move-circle (make-placed-circ (make-posn 55 55) 30) 5 5)
 (make-placed-circ (make-posn 60 60) 30))

(define (move-circle pc dx dy)
  (make-placed-circ
   (make-posn (+ dx (posn-x (placed-circ-center pc)))
              (+ dy (posn-y (placed-circ-center pc))))
   (placed-circ-radius pc)))

;; move-rect : Placed-rect Number Number -> Placed-rect
;; Given a placed-rect and dx dy, produces a new placed-rect moved dx and dy in the coordinates
(check-expect
 (move-rect (make-placed-rect (make-posn 5 5) 30 40) 5 5)
 (make-placed-rect (make-posn 10 10) 30 40))

(define (move-rect pr dx dy)
  (make-placed-rect
   (make-posn (+ dx (posn-x (placed-rect-corner pr)))
              (+ dy (posn-y (placed-rect-corner pr))))
   (placed-rect-width pr)
   (placed-rect-height pr)))