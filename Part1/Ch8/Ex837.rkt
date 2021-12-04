;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex837) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.3.7
; Modify the animation of Exercise 8.3.6 so that the x coordinate is 100+
; 50 cos(t/10) and the y coordinate 100 + 30 sin(t/10)


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

;; T -> Number (x-position)
;; Given T, produce x-position

(define (x-pos t)
  (+ 100 (* 50 (cos (/ t 10)))))


;; T -> Number (y-position)
;; Given T, produce x-position

(define (y-pos t)
  (+ 100 (* 30 (sin (/ t 10)))))


;; T -> Image
;; Given T, produce image of the world
(define (render-dot t)
  (place-image (circle 3 "solid" "red")
               (x-pos t) (y-pos t)
               (empty-scene 200 200)))