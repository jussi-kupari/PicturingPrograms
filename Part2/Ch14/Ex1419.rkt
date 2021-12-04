;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1419) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 14.1.9
; Modify your animation from Exercise 8.4.2 so that the animation ends
; when the picture reaches the bottom of the window.


; Exercise 8.4.2
; Write an animation of a picture of your choice that starts at the top
; of the screen, and moves down by 5 pixels every half second. Use a number, not an image,
; as your model.

(require picturing-programs)

;; A picure moving around the screen based on mouse and key clicks

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a Number
;; interp. the y-position of a red dot

(define D1 50)

;; Template rules used
;; - atomic non-distinct: Number


;; -- Functions

;; Main
;; Start world with (main 0)
(define (main d)
  (big-bang d
    (on-tick next-dot 1/2)
    (to-draw render-dot)
    (stop-when out?)))

;; Dot -> Dot
;; Given a Dot , produce next Dot
(check-expect (next-dot 0) 5)

(define (next-dot d)
  (+ 5 d))


;; Dot -> Image
;; Given a Dot, produce image of the world

(define (render-dot d)
  (place-image DOT 50 d SCENE))

;; Dot -> Boolean
;; Given Dot, produces true if dot is below the image lower edge
(check-expect (out? 100) false)
(check-expect (out? 120) true)

(define (out? d)
  (> (- d (image-height DOT)) (image-height SCENE)))
