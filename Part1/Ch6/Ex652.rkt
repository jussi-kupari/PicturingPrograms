;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex652) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.5.2
; Find an outdoor scene on the Web. Develop an animation in which
; a stick-figure is positioned somewhere appropriate in the scene, and flips upside-
; down every second, staying in the same place; the background should not flip upside-down!


(require picturing-programs)

;; Stick-figure flipping in an outdoor scene

;; -- Constants

; Scene
(define SCENE .)

(define FIG .)


;; -- Data Definition

;; Fig is an image
;; interp. a stick-figure flipping vertically

(define SF1 .)
(define SF2 (flip-vertical .))

(define (fn-for-fig sf)
  ...)

;; Template rules used:
;;  - atomic non-distinct: Image


;; -- Functions

;; Fig -> Fig
;; Makes the figure continuously flip 180 deg vertically (main FIG)


(define (main sf)
  (big-bang sf
    (on-tick next-fig 2)
    (to-draw render-fig)))



;; Fig -> Fig
;; Given Fig, produce next Fig
(check-expect (next-fig SF1) SF2)


; (define (next-fig sf) SF1) ; stub

; <template from Fig>

(define (next-fig sf)
  (flip-vertical sf))

;; Fig -> Image
;; Given Fig, produce image of world
(check-expect (render-fig SF1) (overlay SF1 SCENE))

(define (render-fig sf)
  (overlay sf SCENE))
