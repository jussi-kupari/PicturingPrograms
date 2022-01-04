;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2184) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.4
; Develop a function shapes-overlap? that takes in two placed-shapes and tells whether they overlap.
; 
; Hint: This problem is a little harder. Since each of the two parameters can be either a
; circle or a rectangle, you have four cases to consider. The “both circles” case is handled
; by Exercise 21.7.4 The “both rectangles” case can be handled by using a previously defined
; function on placed-shapes and the “circle and rectangle” cases will require some
; geometrical thinking.

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

;; shapes-overlap? : Placed-shape Placed-shape -> Boolean
;; Given two placed-shapes, produces true if the shapes overlap
(check-expect
 (shapes-overlap? (make-placed-rect (make-posn 0 0) 10 70)
                  (make-placed-circ (make-posn 0 0) 10)) true)
(check-expect
 (shapes-overlap? (make-placed-rect (make-posn 10 10) 10 5)
                  (make-placed-circ (make-posn 0 0) 10)) false)

(define (shapes-overlap? ps1 ps2)
  (cond
    [(and (placed-circ? ps1) (placed-circ? ps2)) (circs-overlap? ps1 ps2)]            
    [(and (placed-rect? ps1) (placed-rect? ps2)) (rects-overlap? ps1 ps2)]        
    [(and (placed-circ? ps1) (placed-rect? ps2)) (circ-rect-overlap? ps1 ps2)]    
    [(and (placed-rect? ps1) (placed-circ? ps2)) (circ-rect-overlap? ps2 ps1)]))  

;; rects-overlap? : Placed-rect Placed-rect -> Boolean?
;; Given two placed-rects, produces true if they overlap
(check-expect
 (rects-overlap? (make-placed-rect (make-posn 0 0) 10 10)
                 (make-placed-rect (make-posn 0 0) 10 10)) true)

(check-expect
 (rects-overlap? (make-placed-rect (make-posn 0 0) 10 10)
                 (make-placed-rect (make-posn 9 9) 10 10)) true)

(check-expect
 (rects-overlap? (make-placed-rect (make-posn 0 0) 10 10)
                 (make-placed-rect (make-posn 9 9) 10 10)) true)

(check-expect
 (rects-overlap? (make-placed-rect (make-posn 0 0) 10 10)
                 (make-placed-rect (make-posn 10 10) 10 10)) false)

(define (rects-overlap? pr1 pr2)
  (and (x-overlap-rect? pr1 pr2)
       (y-overlap-rect? pr1 pr2)))

;; x-overlap-rect? : Placed-rect Placed-rect -> Boolean
;; Given two placed-rects, produces true if the x-sides have overlap
(check-expect
 (x-overlap-rect? (make-placed-rect (make-posn 0 0) 10 10)
                  (make-placed-rect (make-posn 0 0) 10 10)) true)

(check-expect
 (x-overlap-rect? (make-placed-rect (make-posn 0 0) 10 10)
                  (make-placed-rect (make-posn 9 10) 10 10)) true)

(check-expect
 (x-overlap-rect? (make-placed-rect (make-posn 0 0) 10 10)
                  (make-placed-rect (make-posn 10 10) 10 10)) false)

(define (x-overlap-rect? pr1 pr2)
  (< (abs (x-center-dist-rect pr1 pr2))
     (+ (/ (placed-rect-width pr1) 2) (/ (placed-rect-width pr2) 2))))

;; y-overlap-rect? : Placed-rect Placed-rect -> Boolean
;; Given two placed-rects, produces true if the y-sides have overlap
(check-expect
 (y-overlap-rect? (make-placed-rect (make-posn 0 0) 10 10)
                  (make-placed-rect (make-posn 0 0) 10 10)) true)

(check-expect
 (y-overlap-rect? (make-placed-rect (make-posn 0 0) 10 10)
                  (make-placed-rect (make-posn 10 9) 10 10)) true)

(check-expect
 (y-overlap-rect? (make-placed-rect (make-posn 0 0) 10 10)
                  (make-placed-rect (make-posn 10 10) 10 10)) false)

(define (y-overlap-rect? pr1 pr2)
  (< (y-center-dist-rect pr1 pr2)
     (+ (/ (placed-rect-height pr1) 2) (/ (placed-rect-height pr2) 2))))

;; x-center-dist-rect : Placed-rect Placed-rect -> Number
;; Given two placed-rects, produces the absolute distance between the x-side centers
(check-expect
 (x-center-dist-rect (make-placed-rect (make-posn 0 0) 10 10)
                     (make-placed-rect (make-posn 0 0) 10 10)) 0)
(check-expect
 (x-center-dist-rect (make-placed-rect (make-posn 0 0) 10 10)
                     (make-placed-rect (make-posn 0 0) 12 10)) 1)
(check-expect
 (x-center-dist-rect (make-placed-rect (make-posn 0 0) 10 10)
                     (make-placed-rect (make-posn 5 5) 12 10)) 6)

(define (x-center-dist-rect pr1 pr2)
  (abs
   (-
    (+ (posn-x (placed-rect-corner pr1)) (/ (placed-rect-width pr1) 2))
    (+ (posn-x (placed-rect-corner pr2)) (/ (placed-rect-width pr2) 2)))))

;; y-center-dist-rect : Placed-rect Placed-rect -> Number
;; Given two placed-rects, produces the absolute distance between the y-side centers
(check-expect
 (y-center-dist-rect (make-placed-rect (make-posn 0 0) 10 10)
                     (make-placed-rect (make-posn 0 0) 10 10)) 0)
(check-expect
 (y-center-dist-rect (make-placed-rect (make-posn 0 0) 10 10)
                     (make-placed-rect (make-posn 0 0) 10 12)) 1)
(check-expect
 (y-center-dist-rect (make-placed-rect (make-posn 0 0) 10 10)
                     (make-placed-rect (make-posn 5 5) 10 12)) 6)

(define (y-center-dist-rect pr1 pr2)
  (abs
   (-
    (+ (posn-y (placed-rect-corner pr1)) (/ (placed-rect-height pr1) 2))
    (+ (posn-y (placed-rect-corner pr2)) (/ (placed-rect-height pr2) 2)))))
 
;; circs-overlap? : Placed-circ Placed-circ -> Boolean?
;; Given two placed-circles, produces true if the circles overlap
(check-expect (circs-overlap? (make-placed-circ (make-posn 0 0) 10)
                              (make-placed-circ (make-posn 0 0) 10)) true)
(check-expect (circs-overlap? (make-placed-circ (make-posn 0 0) 10)
                              (make-placed-circ (make-posn 2 20) 10)) false)

(define (circs-overlap? c1 c2)
  (< (center-distance-circ c1 c2)
     (+ (placed-circ-radius c1) (placed-circ-radius c2))))

;; center-distance-circ : Placed-circle Placed-circle -> Number
;; Given two place-circles, produces the distance between the centers
(check-expect (center-distance-circ (make-placed-circ (make-posn 0 0) 10)
                                    (make-placed-circ (make-posn 0 0) 10)) 0)
(check-within (center-distance-circ (make-placed-circ (make-posn 0 0) 10)
                                    (make-placed-circ (make-posn 5 5) 10)) 7.07 0.1)

(define (center-distance-circ c1 c2)
  (sqrt
   (+ (sqr (distance-x-circ c1 c2))
      (sqr (distance-y-circ c1 c2)))))

;; distance-x-circ : Placed-circle Placed-circle -> Number
;; Given two placed-circles, produces the distance between the x-coordinates
(check-expect (distance-x-circ (make-placed-circ (make-posn 0 0) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 0)

(check-expect (distance-x-circ (make-placed-circ (make-posn 10 10) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 10)
(define (distance-x-circ c1 c2)
  (- (posn-x (placed-circ-center c1))
     (posn-x (placed-circ-center c2))))

;; distance-y-circ : Placed-circle Placed-circle -> Number
;; Given two placed-circles, produces the distance between the y-coordinates
(check-expect (distance-y-circ (make-placed-circ (make-posn 0 0) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 0)

(check-expect (distance-y-circ (make-placed-circ (make-posn 10 10) 10)
                               (make-placed-circ (make-posn 0 0) 10)) 10)

(define (distance-y-circ c1 c2)
  (- (posn-y (placed-circ-center c1))
     (posn-y (placed-circ-center c2))))

;; circ-rect-overlap? : Placed-circle Placed-rect -> Boolean
;; Given placed-circle and placed-rect, produces true if the shapes overlap
(check-expect
 (circ-rect-overlap? (make-placed-circ (make-posn 0 0) 10)
                     (make-placed-rect (make-posn 0 0) 10 70)) true)
(check-expect
 (x-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 9 9) 10 20)) true)
(check-expect
 (x-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 10 10) 10 5)) false)
(check-expect
 (x-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 5 5) 10 5)) true)

(define (circ-rect-overlap? pc pr)
  (and
   (x-overlap-circ-rect? pc pr)
   (y-overlap-circ-rect? pc pr)))

;; x-overlap-circ-rect? : Placed-circle Placed-rect -> Boolean
;; Given placed-circle and placed-rect, produces true if the x-dimensions overlap
(check-expect
 (x-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 0 0) 10 70)) true)
(check-expect
 (x-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 9 9) 10 20)) true)

(check-expect
 (x-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 10 10) 10 5)) false)

(define (x-overlap-circ-rect? pc pr)
  (< (x-dist-circ-rect pc pr)
     (+ (placed-circ-radius pc)
        (/ (placed-rect-width pr) 2))))

;; y-overlap-circ-rect? : Placed-circle Placed-rect -> Boolean
;; Given placed-circle and placed-rect, produces true if the y-dimensions overlap
(check-expect
 (y-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 0 0) 40 10)) true)
(check-expect
 (y-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 9 9) 5 10)) true)

(check-expect
 (y-overlap-circ-rect? (make-placed-circ (make-posn 0 0) 10)
                       (make-placed-rect (make-posn 10 10) 20 10)) false)

(define (y-overlap-circ-rect? pc pr)
  (< (y-dist-circ-rect pc pr)
     (+ (placed-circ-radius pc)
        (/ (placed-rect-height pr) 2))))

;; x-dist-circ-rect : Placed-circle Placed-rect -> Number
;; Given placed-circle and placed-rect, produces the distance between x-dimension centers
(check-expect
 (x-dist-circ-rect (make-placed-circ (make-posn 0 0) 10)
                   (make-placed-rect (make-posn 0 0) 10 10)) 5)

(define (x-dist-circ-rect pc pr)
  (abs
   (- (posn-x (placed-circ-center pc))
      (+ (posn-x (placed-rect-corner pr))
         (/ (placed-rect-width pr) 2)))))

;; y-dist-circ-rect : Placed-circle Placed-rect -> Number
;; Given placed-circle and placed-rect, produces the distance between y-dimension centers
(check-expect
 (y-dist-circ-rect (make-placed-circ (make-posn 0 0) 10)
                   (make-placed-rect (make-posn 0 0) 10 10)) 5)

(define (y-dist-circ-rect pc pr)
  (abs
   (- (posn-y (placed-circ-center pc))
      (+ (posn-y (placed-rect-corner pr))
         (/ (placed-rect-height pr) 2)))))