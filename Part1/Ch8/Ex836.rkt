;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex836) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.3.6
; Develop an animation that displays a small dot or star at a location
; that varies over time. The x coordinate should be simply t, and the y coordinate t2/20,
; where t is the number of ticks since the animation started.


(require picturing-programs)

;; An animation of a dot at a location that varies over time

;; -- Data Definition

;; Time (T) is a Natural
;; interp. the cumulative amount of ticks since the beginning

(define T1 5)

#;                     ; template
(define (fn-for-t t)
  (...))

;; Template rules used
;; - atomic non-distinct: Natural


;; -- Functions

;; Main

(define (main t)
  (big-bang t
  (on-tick next-t)
  (to-draw render-dot)))

;; T -> T
;; Given T, produce T + 1
(check-expect (next-t 0) 1)

(define (next-t t)
  (add1 t))


;; T -> Image
;; Given T, produce image of the world
(define (render-dot t)
  (place-image (circle 3 "solid" "red")
               t (/(* t t) 20)
               (empty-scene 100 100)))