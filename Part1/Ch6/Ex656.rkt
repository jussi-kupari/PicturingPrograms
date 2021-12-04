;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex656) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.5.6
; Develop an animation in which a stick-figure appears in three differ-
; ent places, scattered around a background scene. One should be right-side-up, one rotated
; 180 degrees, and one flipped upside-down. The first and second should rotate slowly clock-
; wise, while the third rotates slowly counter-clockwise.


(require picturing-programs)

;; An animation of three figures rotating

;; -- Constants

; Width
(define WIDTH 200)

; Height
(define HEIGHT 200)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Figure
(define FIG .)

; Rotation speed
(define SPEED 3)


;; -- Data Definition

;; FigState (FS) is a Number
;; interp. the absolute of cumulative revolving angle
;; negative for cw and positive for ccw

(define FS1 100)
(define FS2 1345)

#;
(define (fn-for-fs fs)
  (...))

;; Template rules used:
;; - atomic non-distinct: Number


;; -- Functions

;; FS -> FS
;; start the world with (main 0)


(define (main fs)
  (big-bang fs                   ; FS -> FS
    (on-tick next-fs)            ; FS -> FS
    (to-draw render-fs)))        ; FS -> Image


;; FS -> FS
;; produce the next FS
(check-expect (next-fs FS1) 103)
(check-expect (next-fs FS2) 1348)

; (define (next-fs fs) fs) ; stub

; <template from FS>

(define (next-fs fs)
  (+ fs 3))



;; FS -> Image
;; Create image of the current world state
(check-expect
 (render-fs FS1)
 (overlay
  (beside (rotate (* FS1 -1) FIG)
          (rotate-180 (rotate (* FS1 -1) FIG))
          (flip-vertical (rotate (* FS1 -1) FIG))) SCENE))

(define (render-fs fs)
  (overlay
   (beside (rotate (* fs -1) FIG)
           (rotate-180 (rotate (* fs -1) FIG))
           (flip-vertical (rotate (* fs -1) FIG))) SCENE))














