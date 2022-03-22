;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1024) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 10.2.4
; Develop an animation that displays a digital counter, in 18-point
; blue numerals. It should start at 0 and increase by 1 each second.
; Hint: Since the change every second is a numeric change you should
; usea number as the model. But to display it on the screen, you’ll
; need to turn the number into an image.
; 
; Have you written a function
; that does this?

(require picturing-programs)

;; an animation of a digital counter

;; -- Constants

;Scene
(define SCENE (empty-scene 50 50))

;; -- Data Definition

;; DigitalCounter is a Natural
;; interp. a counter number

;; -- Functions

;; DC -> DC
;; A digital counter
;; initialize the counter with (main 0)
(define (main dc)
  (big-bang dc
    (on-tick tock 1)
    (to-draw render-counter)))

;; DC -> DC
;; Given a counter number, produce next number
(check-expect (tock 100) 101)

(define (tock dc)
  (add1 dc))

;; DC -> Image
;; Given DC, produce image of the counter
(check-expect (render-counter 100)
              (overlay (text (number->string 100) 18 "blue") SCENE))

(define (render-counter dc)
  (overlay (text (number->string dc) 18 "blue") SCENE))