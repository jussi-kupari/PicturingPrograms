;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1025) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 10.2.5
; Develop an animation that displays a number that starts at 0 and
; increases by 1 each second, while simultaneously moving one pixel
; to the right each second. So, for example, after 24 seconds you
; should see the decimal number 24, 24 pixels from the left edge
; of the window.

(require picturing-programs)

;; An animation of a number-counter that moves to the right

;; -- Constants

;Scene
(define SCENE (empty-scene 500 20))

;; -- Data Definition

;; Counter is a Natural
;; interp. a number counter that also serves as the x-position

;; -- Functions

;; Counter -> Counter
;; an image of a counter that moves to the right
;; initialize world with (main 0)

(define (main c)
  (big-bang c
    (on-tick tock 1)
    (to-draw render-counter)))

;; Counter -> Counter
;; Given an counter, adds one to it
(check-expect (tock 0) 1)

(define (tock c)
  (add1 c))

;; Counter -> Image
;; Given a counter, renders the image of it in the correct position
(check-expect (render-counter 24)
              (place-image (text (number->string 24) 18 "black") 24 10 SCENE))

(define (render-counter c)
  (place-image (text (number->string c) 18 "black") c 10 SCENE))