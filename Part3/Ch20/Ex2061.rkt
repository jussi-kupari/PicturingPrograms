;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2061) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 20.6.1
; Write an animation of a picture that moves up, down, left,
; and right in response to the "up", "down", "left", and "right" arrow keys.
; It should ignore all other keys.

(require picturing-programs)

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
(check-expect (next-dot (make-posn 0 0) "down") (make-posn 0 1))
(check-expect (next-dot (make-posn 0 0) "up") (make-posn 0 -1))
(check-expect (next-dot (make-posn 0 0) "left") (make-posn -1 0))
(check-expect (next-dot (make-posn 0 0) "right") (make-posn 1 0))
(check-expect (next-dot (make-posn 0 0) " ") (make-posn 0 0))

(define (next-dot d ke)
  (cond
    [(key=? ke "up") (make-posn (posn-x d) (sub1 (posn-y d)))]
    [(key=? ke "down") (make-posn (posn-x d) (add1 (posn-y d)))]
    [(key=? ke "left") (make-posn (sub1 (posn-x d)) (posn-y d))]
    [(key=? ke "right") (make-posn (add1 (posn-x d)) (posn-y d))]
    [else d]))

;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-posn 45 34)) (place-image DOT 45 34 SCENE))

(define (render-dot d)
  (place-image DOT (posn-x d) (posn-y d) SCENE))