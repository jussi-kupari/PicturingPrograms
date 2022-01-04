;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2174) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.4
; Define a function circs-overlap? that takes in two placed-circ
; structures and tells whether they overlap.
; 
; Hint: Use the distance between their centers, together with their radii.

(require picturing-programs)

;; -- Data Definition

(define-struct placed-circ (center radius))
;; Placed-circ is a (make placed-circ Posn Natural)
;; interp. a representation of a circle with the xy position of the center and radius

;; -- Functions

;; circs-overlap? : Placed-circ Placed-circ -> Boolean?
;; Given two placed circles, produces true if the circles overlap
(check-expect (circs-overlap? (make-placed-circ (make-posn 0 0) 10)
                              (make-placed-circ (make-posn 0 0) 10)) true)
(check-expect (circs-overlap? (make-placed-circ (make-posn 0 0) 10)
                              (make-placed-circ (make-posn 2 20) 10)) false)

(define (circs-overlap? c1 c2)
  (< (center-distance-circ c1 c2)
     (+ (placed-circ-radius c1) (placed-circ-radius c2))))

;; center-distance-circ : Placed-circle Placed-circle -> Number
;; Given two place circles, produces the distance between the centers
(check-expect (center-distance-circ (make-placed-circ (make-posn 0 0) 10)
                                    (make-placed-circ (make-posn 0 0) 10)) 0)
(check-within (center-distance-circ (make-placed-circ (make-posn 0 0) 10)
                               (make-placed-circ (make-posn 5 5) 10)) 7.07 0.1)

(define (center-distance-circ c1 c2)
  (sqrt
   (+ (sqr (distance-x-circ c1 c2))
      (sqr (distance-y-circ c1 c2)))))

;; distance-x-circ : Placed-circle Placed-circle -> Number
;; Given two place circles, produces the distance between the x-coordinates
(check-expect (distance-x-circ (make-placed-circ (make-posn 0 0) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 0)

(check-expect (distance-x-circ (make-placed-circ (make-posn 10 10) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 10)
(define (distance-x-circ c1 c2)
  (- (posn-x (placed-circ-center c1))
     (posn-x (placed-circ-center c2))))

;; distance-y-circ : Placed-circle Placed-circle -> Number
;; Given two place circles, produces the distance between the y-coordinates
(check-expect (distance-y-circ (make-placed-circ (make-posn 0 0) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 0)

(check-expect (distance-y-circ (make-placed-circ (make-posn 10 10) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 10)

(define (distance-y-circ c1 c2)
  (- (posn-y (placed-circ-center c1))
     (posn-y (placed-circ-center c2))))