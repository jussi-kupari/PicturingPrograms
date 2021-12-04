;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex851) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.5.1
; Write an animation of a picture of your choice that appears each
; second at a different x-coordinate (and the same y-coordinate), chosen from among the
; five choices 20, 60, 100, 140, 180.


(require picturing-programs)

;; Animation of dot appearing randomly at certain x-positions

;; -- Constants

;Scene
(define SCENE (empty-scene 200 100))

;Dot
(define DOT (circle 5 "solid" "red"))

;y-position
(define Y 50)


;; -- Data Definition

;; Pos is a random number [0, 5)one of:
;; - 0 => 20  ;random 0 equals 20
;; - 1 => 60
;; - 2 => 100
;; - 3 => 140
;; - 4 => 180
;; interp. the x-position of red dot

#;
(define (fn-for-pos pos)
  (cond
    [(equal? pos 0) 20]
    [(equal? pos 1) 60]
    [(equal? pos 2) 100]
    [(equal? pos 3) 140]
    [(equal? pos 4) 180]))

;; Template rules used
;; - one of: 2 cases
;; - atomic distinct: 0
;; - atomic distinct: 1
;; - atomic distinct: 2
;; - atomic distinct: 3
;; - atomic distinct: 4


;; -- Functions

;; Main
(define (main pos)
  (big-bang pos
    (on-tick random-pos 1)
    (to-draw render-image)))


;; Pos -> Pos
;; Given Pos, produce next Pos
(check-member-of (random-pos 0) 20 60 100 140 180)

(define (random-pos pos)
  (cond
    [(equal? (random 5) 0) 20]
    [(equal? (random 5) 1) 60]
    [(equal? (random 5) 2) 100]
    [(equal? (random 5) 3) 140]
    [else 180]))

;; Pos -> Image
;; Given Pos, produce image of the world

(define (render-image pos)
  (place-image DOT pos Y SCENE))
