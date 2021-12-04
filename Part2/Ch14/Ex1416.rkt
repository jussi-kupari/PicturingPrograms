;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1416) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 14.1.6
; Modify the animation of Exercise 6.4.4 so that the animation ends
; when the image (a row of dots) is wider than the window.
; 
; 
; Exercise 6.4.4
; Develop an animation which starts with a small red dot at the top-left
; corner of the window, then replaces it with two red dots side by side, then
; with a row of four, then a row of eight, then a row of sixteen . . .
; doubling every three seconds.


(require picturing-programs)

;; -- Constants

; Width
(define WIDTH 800)

; Height
(define HEIGHT 50)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; y-position
(define Y 25)

; Dot
(define DOT (circle 10 "solid" "red"))


;; -- Data Definition

;; Dots is an image
;; ínterp. the image of one or several Red dots side by side

(define DOTS1 (circle 10 "solid" "red"))
(define DOTS2 (beside (circle 10 "solid" "red") (circle 10 "solid" "red")))
(define DOTS3 (beside DOTS2 DOTS2))


;; -- Functions

;; Dots -> Dots
;; Red dots appearing side-by-side doubling every 3 seconds (main DOT)

(define (main d)
  (big-bang d                   
    (on-tick next-dots 1)        
    (to-draw show-it 500 20)
    (stop-when too-wide?)))  


;; Dots -> Dots
(check-expect (next-dots DOTS1) DOTS2)
(check-expect (next-dots DOTS2) DOTS3)

(define (next-dots d)
  (beside d d))


;; Dots -> Boolean
;; Given Dots (image), produces true if the image is wider than the scene

(define (too-wide? d)
  (> (image-width d) (image-width SCENE)))


