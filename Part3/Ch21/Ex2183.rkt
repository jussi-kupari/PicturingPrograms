;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2183) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.3
; Develop a function contains? that takes in a placed-shape and aposn and tells
; whether the posn is inside the shape. Consider the shape to include its
; border, so a point exactly on the border is “contained” in the shape.


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

;; contains? : Placed-shape Posn -> Boolean
;; Given a placed-shape and a position, produces true if the position is inside the shape
(check-expect
 (contains? (make-placed-circ (make-posn 25 25) 25) (make-posn 25 50)) true)
(check-expect
 (contains? (make-placed-circ (make-posn 25 25) 25) (make-posn 5 50)) false)
(check-expect
 (contains? (make-placed-rect (make-posn 0 0) 10 10) (make-posn 0 0)) true)
(check-expect
 (contains? (make-placed-rect (make-posn 0 0) 5 5) (make-posn 10 10)) false)


(define (contains? ps pos)
  (cond
    [(placed-circ? ps) (pos-inside-circ? pos ps)]
    [(placed-rect? ps) (pos-inside-rect? pos ps)]))


;; pos-inside-circ? : Posn Placed-circ -> Boolean
;; Given a position and a placed-circ, produces true if the position is inside the circle
(check-expect
 (pos-inside-circ? (make-posn 0 0) (make-placed-circ (make-posn 0 0) 10)) true)
(check-expect
 (pos-inside-circ? (make-posn 25 50) (make-placed-circ (make-posn 25 25) 25)) true)
(check-expect
 (pos-inside-circ? (make-posn 5 50) (make-placed-circ (make-posn 25 25) 25)) false)


(define (pos-inside-circ? pos pc)
  (<= (dist-from-center pos pc) (placed-circ-radius pc)))


;; dist-from-center : Posn Placed-circ -> Number
;; Given a position and a placed-circle, produces the distance of the pos from circle center
(check-expect (dist-from-center (make-posn 0 0) (make-placed-circ (make-posn 0 0) 10)) 0)
(check-within (dist-from-center (make-posn 0 0) (make-placed-circ (make-posn 5 5) 10)) 7.07 0.02)

(define (dist-from-center pos pc)
  (sqrt
   (+ (sqr (- (posn-x pos) (posn-x (placed-circ-center pc))))
      (sqr (- (posn-y pos) (posn-y (placed-circ-center pc)))))))


;; pos-inside-rckt? : Posn Placed-rect -> Boolean
;; Given a position and a placed-rect, produces true if the position is inside the rectangle
(check-expect
 (pos-inside-rect? (make-posn 0 0) (make-placed-rect (make-posn 0 0) 10 10)) true)
(check-expect
 (pos-inside-rect? (make-posn 10 10) (make-placed-rect (make-posn 0 0) 5 5)) false)

(define (pos-inside-rect? pos pr)
  (and (<= (posn-x pos) (placed-rect-width pr))
       (<= (posn-y pos) (placed-rect-height pr))))
