;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex841) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 8.4.1
; Write an animation of a picture of your choice that moves
; right 1 pixel whenever the mouse is moved or clicked, and left 4 pixels whenever a key is
; typed on the keyboard.

(require picturing-programs)

;; A picure moving around the screen based on mouse and key clicks

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a Number
;; interp. the x-position of a red dot

(define D1 50)

#;                     ;template
(define (fn-for-dot d)
  (...))

;; Template rules used
;; - atomic non-distinct: Number


;; -- Functions

;; Main
;; Start world with (main 50)
(define (main d)
  (big-bang d
    (on-key key-move)
    (on-mouse mouse-move)
    (to-draw render-dot)))

;; Dot KeyEv -> Dot
;; Given a Dot and a key-event, produce next Dot
(check-expect (key-move 40 "") 40)
(check-expect (key-move 40 "x") 36)

(define (key-move d ke)
  (cond
    [(key-event? ke) (- d 4)]
    [else d]))

;; Dot MouseEv -> Dot
;; Given a Dot and a mouse-event, produce next Dot
(check-expect (mouse-move 40 0 0 "move") 40)
(check-expect (mouse-move 40 0 0 "button-down") 41)

(define (mouse-move d x y me)
  (cond
    [(mouse=? me "button-down") (+ d 1)]
    [else d]))

;; Dot -> Image
;; Given a Dot, produce image of the world

(define (render-dot d)
  (place-image DOT d 50 SCENE))












