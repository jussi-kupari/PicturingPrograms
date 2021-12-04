;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex843) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.4.3
; Write an animation of a dot that doubles in size every 5 seconds, but
; shrinks by 4 pixels every time a key is typed on the keyboard.


(require picturing-programs)

;; A picure moving around the screen based on mouse and key clicks

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))


;; -- Data Definition

;; Dot is a Number
;; interp. the radius of a red dot

(define D1 50)

#;                     ;template
(define (fn-for-dot d)
  (...))

;; Template rules used
;; - atomic non-distinct: Number


;; -- Functions

;; Main
;; Start world with (main 5)
(define (main d)
  (big-bang d
    (on-tick next-dot 5)
    (to-draw render-dot)
    (on-key shrink-dot)))

;; Dot -> Dot
;; Given a Dot , produce next Dot
(check-expect (next-dot 5) 10)

(define (next-dot d)
  (* 2 d))


;; Dot KeyEv -> Dot
;; Given a Dot and a key-event, produce next Dot
(check-expect (shrink-dot 10 "") 10)
(check-expect (shrink-dot 10 "x") 6)

(define (shrink-dot d ke)
  (cond
    [(key-event? ke) (- d 4)]
    [else d]))


;; Dot -> Image
;; Given a Dot, produce image of the world

(define (render-dot d)
  (place-image (circle d "solid" "red") 50 50 SCENE))
