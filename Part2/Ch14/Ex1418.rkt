;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1418) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 14.1.8
; Modify the animation of Exercise 8.3.1 or 8.3.2 so that
; the animation ends when the circle is wider or taller than
; the window. Hint: Recall that in these animations, the model
; was a number representing radius. The diameter is twice the
; radius. Be sure to test the program with a window that’s wider
; than it is tall, or taller than it is wide.


; Practice Exercise 8.3.1
; Recall that for the animation of Exercise 8.2.1, we decided that the model is a number
; indicating the radius of the circle. How would we change the radius? Well, if we wanted
; the circle to grow over time, we could add 1 to the radius at each clock tick.
; 
; Try this.
; 
; Exercise 8.3.2
; Modify the display of Exercise 8.3.1 so that the circle appears centered
; and unmoving in a 200x200 white background, so it appears to grow around a fixed center.

(require picturing-programs)

;; A static animation of a growing blue circle

;; -- Constants

;Scene
(define SCENE (empty-scene 50 50))

;; -- Data Definition

;; BlueCircle (BC) is a Number
;; interp. the radius of the circle

(define BC1 5)
(define BC2 23)


;; Template rules used:
;; - atomic non-distinct: Number


;; -- Functions

;; BC -> BC
;; Start the world with (main *number*)


(define (main bc)
  (big-bang bc
    (check-with number?)
    (to-draw render-bc)
    (on-tick next-bc 0.25)
    (stop-when too-big?)))

;; Number -> BC
;; Given a number, produce a blue circle with that radius
(check-expect
 (render-bc 10)(overlay (circle 10 "solid" "blue") SCENE))

(define (render-bc bc)
  (overlay (circle bc "solid" "blue") SCENE))


;; BC -> BC
;; Given BC, produce the next BC
(check-expect (next-bc 10) (add1 10))

(define (next-bc bc)
  (add1 bc))


;; BC -> Boolean
;; Given BC, produce true if the BC * 2 is equal or bigger than the side of the scene
(check-expect (too-big? 20) false)
(check-expect (too-big? 25) true)
(check-expect (too-big? 30) true)

(define (too-big? bc)
  (>= (* 2 bc) (image-width SCENE)))








