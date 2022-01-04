;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2185) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.5
; Develop an animation like Exercise 20.6.4 or 21.6.3, but with each
; shape being either a circle (with random location and radius) or a rectangle (with random
; location, width, and height), with a 50% probability of each shape. I recommend testing
; this with a slow clock tick, e.g. 5 seconds, so you have time to try clicking in several
; places just outside various sides of the shape to make sure they don’t count as hits.

; Exercise 20.6.4
; Modify Exercise 20.6.3 so that if the user clicks the mouse on the
; dot (i.e. within a distance of 3 from its current center), the animation ends with the
; message “Congratulations!” This forms a sort of video-game, which will get harder if you
; shorten the time between ticks.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;; -- Data Definitions

;; Shape is one of:
;; - Placed-circ
;; - Placed-rect

(define-struct placed-circ (center radius))
;; Placed-circ is a (make placed-circ Posn Natural)
;; interp. a representation of a circle with the xy position of the center and radius

;Initial shape
(define CIRC (make-placed-circ (make-posn 0 0) 10))

(define-struct placed-rect (corner width height))
;; Placed-rect is a (make placed-rect Posn Natural)
;; interp. a representation of a rectangle with the xy position of the “top-left corner”
;; and width and height of the sides

;; -- Functions

;; main : Shape -> Shape
(define (main s)
  (big-bang s
    (on-tick next-shape 5)
    (to-draw render-shape)
    (on-mouse hit-the-shape)))

;; next-shape : Shape -> Shape
;; Given Shape, produces a random Shape with random location (x,y) within the scene

(define (next-shape s)
  (cond
    [(= (random 2) 0)
     (make-placed-circ
      (make-posn (random (image-width SCENE))
                 (random (image-height SCENE))) (random 20))]
    [else
     (make-placed-rect (make-posn (random (image-width SCENE))
                                  (random (image-height SCENE)))
                       (random 40) (random 40))]))

;; render-dot : Shape -> Image
;; Given a Shape, produces an image of the Shape on the scene

(define (render-shape s)
  (cond
    [(placed-circ? s)
     (place-image
      (circle (placed-circ-radius s) "solid" "red")
      (posn-x (placed-circ-center s))
      (posn-y (placed-circ-center s))
      SCENE)]
    [else (place-image
           (rectangle (placed-rect-width s)
                      (placed-rect-height s) "solid" "red")
           (posn-x (placed-rect-corner s))
           (posn-y (placed-rect-corner s))
           SCENE)]))

;; hit-the-shape : Shape Number Number MouseEv -> Shape or stop
;; Given a Shape, mouse xy and mouse-event, continue or stop the animation
(check-expect
 (hit-the-shape (make-placed-circ (make-posn 0 0) 10) 0 0 "move")
 (make-placed-circ (make-posn 0 0) 10))
(check-expect
 (hit-the-shape (make-placed-circ (make-posn 0 0) 10) 0 0 "button-down")
 (stop-with (text "Congratulations, you hit the shape!" 30 "green")))
(check-expect
 (hit-the-shape (make-placed-rect (make-posn 0 0) 30 30) 15 15 "move")
 (make-placed-rect (make-posn 0 0) 30 30))
(check-expect
 (hit-the-shape (make-placed-rect (make-posn 0 0) 30 30) 15 15 "button-down")
 (stop-with (text "Congratulations, you hit the shape!" 30 "green")))

(define (hit-the-shape s x y me)
  (cond
    [(placed-circ? s) (hit-the-circ s x y me)]
    [else (hit-the-rect s x y me)]))

;; hit-the-circ : Placed-circ Number Number MouseEv -> Placed-circ or stop
;; Given a Placed-circ, mouse xy and mouse-event, continue or stop the animation
(check-expect
 (hit-the-circ (make-placed-circ (make-posn 0 0) 10) 5 5 "button-down")
 (make-placed-circ (make-posn 0 0) 10))
(check-expect
 (hit-the-circ (make-placed-circ (make-posn 0 0) 10) 0 0 "move")
 (make-placed-circ (make-posn 0 0) 10))
(check-expect
 (hit-the-circ (make-placed-circ (make-posn 0 0) 10) 0 0 "button-down")
 (stop-with (text "Congratulations, you hit the shape!" 30 "green")))

(define (hit-the-circ pc x y me)
  (cond
    [(and (mouse=? me "button-down")
          (= x (posn-x (placed-circ-center pc)))
          (= y (posn-y (placed-circ-center pc))))
     (stop-with (text "Congratulations, you hit the shape!" 30 "green"))]
    [else pc]))

;; hit-the-rect : Placed-rect Number Number MouseEv -> Placed-rect or stop
;; Given a Placed-rect, mouse xy and mouse-event, continue or stop the animation
(check-expect
 (hit-the-rect (make-placed-rect (make-posn 0 0) 30 30) 10 10 "button-down")
 (make-placed-rect (make-posn 0 0) 30 30))
(check-expect
 (hit-the-rect (make-placed-rect (make-posn 0 0) 30 30) 15 15 "move")
 (make-placed-rect (make-posn 0 0) 30 30))
(check-expect
 (hit-the-rect (make-placed-rect (make-posn 0 0) 30 30) 15 15 "button-down")
 (stop-with (text "Congratulations, you hit the shape!" 30 "green")))

(define (hit-the-rect pr x y me)
  (cond
    [(and (mouse=? me "button-down")
          (= x (+ (posn-x (placed-rect-corner pr)) (/ (placed-rect-width pr) 2)))
          (= y (+ (posn-y (placed-rect-corner pr)) (/ (placed-rect-height pr) 2))))
     (stop-with (text "Congratulations, you hit the shape!" 30 "green"))]
    [else pr]))