;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex838) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.3.8
; Add the variable definitions
; 
; (define XCENTER 100)
; (define YCENTER 100)
; (define XSCALE 50)
; (define YSCALE 30)
; to your definitions pane, and replace the formulæ in Exercise 8.3.7 with
; x = XCENTER + XSCALE ∗ cos(t/10)
; and
; y = Y CENTER + Y SCALE ∗ sin(t/10)
; 
; The animation should still work exactly as before. Check that it does.


(require picturing-programs)

;; An animation of a dot at a location that varies over time


;; -- Constants

(define XCENTER 100)
(define YCENTER 100)
(define XSCALE 50)
(define YSCALE 30)


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
  (* (+ XCENTER XSCALE)(cos (/ t 10))))


;; T -> Number (y-position)
;; Given T, produce x-position

(define (y-pos t)
  (* (+ YCENTER YSCALE) (sin (/ t 10))))


;; T -> Image
;; Given T, produce image of the world
(define (render-dot t)
  (place-image (circle 3 "solid" "red")
               (x-pos t) (y-pos t)
               (empty-scene 200 200)))