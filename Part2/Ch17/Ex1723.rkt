;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1723) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.2.3
; Write an animation like that of Exercise 8.5.3, but coloring each dot
; either red, green, or blue, at random.
; Hint: Try writing a helper function that returns one of the three color names at random.


; Exercise 8.5.3
; Write an animation that starts with a blank screen, and each half
; second adds a small dot at a completely random location — both the x coordinate and the
; y coordinate are chosen at random.

(require picturing-programs)

;; Animation where given image slowly covers up with red, green and blue dots

;; -- Constants

;Dots of different color
(define RED (circle 5 "solid" "red"))
(define GREEN (circle 5 "solid" "green"))
(define BLUE (circle 5 "solid" "blue"))

;; -- Data Definitions

;; img is an Image
;; interp. a given image that has 0 or more red dots on it


;; -- Functions

;; Main
;; Initiate world with (main *image*)

(define (main img)
  (big-bang img
    (on-tick new-img 1/2)
    (to-draw show-img)))

;; img Random Random -> img
;; Given img, produce img with added dot

(define (new-img img)
  (place-image (random-dot img)
               (random (- (image-width img) 5))
               (random (- (image-height img) 5))
               img))

;; img -> img
;; Given img, ignores it and produces a randomly colored dot
(check-member-of (random-dot RED) RED GREEN BLUE)

(define (random-dot img)
  (cond
    [(= (random 3) 0) GREEN]
    [(= (random 2) 0) RED]
    [else BLUE]))


;; img -> img
;; Given img, return same img

(define (show-img img) img)
