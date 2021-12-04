;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2142) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.4.2
; Choose a function you’ve already written that operates on posn, and
; rewrite it to operate on a my-posn instead.


; Worked Exercise 20.6.1
; Write an animation of a picture that moves up, down, left,
; and right in response to the "up", "down", "left", and "right" arrow keys.
; It should ignore all other keys.

(require picturing-programs)


;; -- Data Definition

(define-struct my-posn (x y))
;; my-posn is (make-my-posn Number Number)
;; interp. a position with x- and y-coordinates

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a posn
;; interp. the x,y coordinates of a red dot on the scene


;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (check-with posn?)
    (on-key next-dot)
    (to-draw render-dot)))

;; next-dot : Dot KeyEv -> Dot
;; Given Dot and a key-event. produces the next dot
(check-expect (next-dot (make-my-posn 0 0) "down") (make-my-posn 0 1))
(check-expect (next-dot (make-my-posn 0 0) "up") (make-my-posn 0 -1))
(check-expect (next-dot (make-my-posn 0 0) "left") (make-my-posn -1 0))
(check-expect (next-dot (make-my-posn 0 0) "right") (make-my-posn 1 0))
(check-expect (next-dot (make-my-posn 0 0) " ") (make-my-posn 0 0))

(define (next-dot d ke)
  (cond
    [(key=? ke "up") (make-my-posn (my-posn-x d) (sub1 (my-posn-y d)))]
    [(key=? ke "down") (make-my-posn (my-posn-x d) (add1 (my-posn-y d)))]
    [(key=? ke "left") (make-my-posn (sub1 (my-posn-x d)) (my-posn-y d))]
    [(key=? ke "right") (make-my-posn (add1 (my-posn-x d)) (my-posn-y d))]
    [else d]))

;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-my-posn 45 34)) (place-image DOT 45 34 SCENE))

(define (render-dot d)
  (place-image DOT (my-posn-x d) (my-posn-y d) SCENE))