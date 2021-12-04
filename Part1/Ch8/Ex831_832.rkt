;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex831_832) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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



;; -- Data Definition

;; BlueCircle (BC) is a Number
;; interp. the radius of the circle

(define BC1 5)
(define BC2 23)

#;
(define (fn-for-bc bc)
  (...))


;; Template rules used:
;; - atomic non-distinct: Number


;; -- Functions

;; BC -> BC
;; Start the world with (main *number*)


(define (main bc)
  (big-bang bc
    (check-with number?)
    (to-draw render-bc)
    (on-tick next-bc 0.5)))

;; Number -> BC
;; Given a number, produce a blue circle with that radius
(check-expect
 (render-bc 10)(overlay (circle 10 "solid" "blue")
                        (empty-scene 200 200)))


;(define (render-bc bc) (circle 0 "solid" "blue")) ; stub

;<template from BC>

(define (render-bc bc)
  (overlay (circle bc "solid" "blue")
           (empty-scene 200 200)))


;; BC -> BC
;; Given BC, produce the next BC
(check-expect (next-bc 10) (add1 10))

;(define (next-bc bc) 0) ;stub

;<template from BC>

(define (next-bc bc)
  (add1 bc))











