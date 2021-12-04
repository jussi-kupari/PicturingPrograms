;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex655) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.5.5
; Develop an animation in which a stick-figure stands at the edge of a
; lake (part of the background scene) and does slow cartwheels
; (say, 5 degrees every 1/10 second). The figure’s reflection
; should appear below him in the lake, upside down and doing
; slow cartwheels in the opposite direction
; ( i.e. if the stick figure is rotating clockwise, the
; reflection should be rotating counter-clockwise).


(require picturing-programs)

;; Stick-figure rotating slowly with a mirror-image in an outdoor scene

;; -- Constants

; Scene
(define SCENE .)

(define FIG .)


;; -- Data Definition

;; Fig is a number
;; interp. the abs rotation of two figures in opposite directions

(define SF1 5)
(define SF2 50)

(define (fn-for-fig sf)
  ...)

;; Template rules used:
;;  - atomic non-distinct: Number


;; -- Functions

;; Fig -> Fig
;; Creates a world of two figures rotating in opposite directions


(define (main sf)
  (big-bang sf
    (on-tick next-fig)
    (to-draw render-fig)))


;; Fig -> Fig
;; Given Fig, produce next fig


(check-expect (next-fig SF1) 10)

(define (next-fig sf)
  (+ sf 5))

;; Fig -> Image
;; Given Fig, create image of world

(check-expect (render-fig SF1)
              (overlay (above (rotate 5 FIG) (rotate -5 FIG)) SCENE))

(define (render-fig sf)
  (overlay (above (rotate sf FIG) (rotate (* sf -1) FIG)) SCENE))