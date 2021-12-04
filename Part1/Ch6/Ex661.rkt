;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex661) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 6.6.1
; Develop an animation of a picture of your choice, moving
; right 10 pixels whenever the mouse is moved or clicked.


(require picturing-programs)

;; Animation of a figure moving on screen on mouse event (move/click)

;; -- Constants

; Width
(define WIDTH 1000)

; Height
(define HEIGHT 100)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Figure
(define FIG .)


;; -- Data Definition

;; Fig is a number
;; interp. x-position of figure

#;
(define (fn-for-fig sf)
  ...)

;; Template rules used:
;;  - atomic non-distinct: Number


;; -- Functions


;; Fig -> Fig
;; Creates the current state of the world (start with (main 0))

(define (main sf)
  (big-bang sf
  (on-mouse next-fig)
  (to-draw render-fig)))


;; Fig Number Number MouseEv -> Fig
;; Given Fig x- and y-position of mouse and a MouseEv(= click/move), produce next fig

(check-expect (next-fig 50 0 0 "button-down") 60)
(check-expect (next-fig 50 0 0 "move") 60)
(check-expect (next-fig 50 0 0 "button-up") 50)
(check-expect (next-fig 50 0 0 "drag") 50)

(define (next-fig sf x y me)
  (cond
    [(mouse=? me "button-down") (+ sf 10)]
    [(mouse=? me "move") (+ sf 10)]
    [else sf]))


;; Fig -> Image
;; Given Fig, produce img of world

(check-expect (render-fig 50)
              (place-image FIG 50 50 SCENE))

(define (render-fig sf)
  (place-image FIG sf 50 SCENE))