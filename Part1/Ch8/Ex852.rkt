;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex852) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.5.2
; Write an animation of a picture of your choice that moves either 1
; pixel left, 1 pixel right, or not at all, with equal probability, four times a second.

(require picturing-programs)

;; Animation of a Dot moving around on the screen


;; -- Constants

;Scene
(define SCENE (empty-scene 200 100))

;Dot
(define DOT (circle 5 "solid" "red"))

;y-position
(define Y 50)


;; -- Data Definitions

;; Rand is one of
;; -1
;;  0
;;  1
;; interp. the x-position-change of red dot


;; Pos is a Number
;; interp. x-position of dot
 

;; -- Functions

;; Main
;; Initiate world with (main 100)

(define (main pos)
  (big-bang pos
    (on-tick next-pos 1/4)
    (to-draw render-image)))


;; -> Rand
;; Produce a Rand: 0, 1 or -1
(check-member-of (next-rand 0) -1 0 1)

(define (next-rand pos)
  (cond
    [(equal? (random 2) 0) (random 2)]
    [else (* (random 2) -1)]))


;; Pos Rand -> Pos
;; Given Pos and Rand
;; produce next Pos
(check-member-of (next-pos 100) 99 100 101)

(define (next-pos pos)
  (+ (next-rand pos) pos))


;; Pos -> Image
;; Given Pos, produce image of the world

(define (render-image pos)
  (place-image DOT pos Y SCENE))
