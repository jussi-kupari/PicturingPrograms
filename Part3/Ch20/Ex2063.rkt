;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2063) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.6.3
; Develop an animation of a dot that jumps randomly around the
; window: every half second, it disappears from where it was and
; appears at a completely random location with
; 0 ≤ x ≤ WIDTH and 0 ≤ y ≤ HEIGHT.
; 
; Hint: This is easier than Exercise 20.6.1, since you don’t need
; to worry about what key was pressed. Use a posn as the model. You
; can get this to work with an image as the model, but Exercise
; 20.6.4 builds on this one, and it’s much easier if you use a posn
; as the model.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a posn
;; interp. the (x,y) position of the dot


;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (on-tick next-dot 1/2)
    (to-draw render-dot)))

;; next-dot : Dot -> Dot
;; Given Dot, produces the next dot with random (x,y) within the scene

(define (next-dot d)
  (make-posn (random (image-width SCENE))
             (random (image-height SCENE))))


;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-posn 0 0)) (place-image DOT 0 0 SCENE))

(define (render-dot d)
  (place-image DOT (posn-x d) (posn-y d) SCENE))