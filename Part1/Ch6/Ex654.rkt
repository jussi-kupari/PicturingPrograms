;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex654) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.5.4
; 
; Develop an animation which shows a picture of your choice at the
; center of the animation window, rotating smoothly (say, 5 degrees every 1/10 second).


(require picturing-programs)

;; Picture of a red bar rotating on the scene


;; -- Constants

; Side
(define SIDE 100)

; Scene
(define SCENE (empty-scene SIDE SIDE))

; Bar
(define BAR (rectangle 30 15 "solid" "red"))

;; -- Data Definitions

;; Angle is a number
;; interp. the angle of the bar

(define A1 270)
(define A2 13)

#;
(define (fn-for-bar b)
  ...)

;; Template rules used:
;;  - atomic non-distinct: Number


;; -- Functions

;; Angle -> Angle
;; Creates a rotating bar in the scene (main 0)

(define (main a)
  (big-bang a
      (on-tick next-angle 1/10)
    (to-draw render-angle)))


;; Angle -> Angle
;; Given angle, produce next angle
(check-expect (next-angle 50) 55)

;(define (next-angle a) 0) ; stub

;<template from Angle>

(define (next-angle a)
  (+ a 5))

;; Angle -> Image
;; Given angle, render image of the scene with bar
(check-expect (render-angle 50)
              (overlay (rotate 50 BAR) SCENE))


#;
(define (render-angle a)           ; stub
  (overlay (rotate 50 BAR) SCENE))


(define (render-angle a)
  (overlay (rotate a BAR) SCENE))

