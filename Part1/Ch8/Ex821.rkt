;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex821) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 8.2.1
; Develop an animation whose “model” is a number, and
; whose “view” is a blue circle of that radius. For now, it won’t change.

(require picturing-programs)


;; A static animation of a blue circle



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
    (to-draw render-bc)))

;; Number -> BC
;; Given a number, produce a blue circle with that radius
(check-expect (render-bc 10)(circle 10 "solid" "blue"))


;(define (render-bc bc) (circle 0 "solid" "blue")) ; stub

;<template from BC>

(define (render-bc bc)
  (circle bc "solid" "blue"))


















