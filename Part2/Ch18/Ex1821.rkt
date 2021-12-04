;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1821) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 18.2.1
; Develop an animation of a picture (say, a calendar) that moves left or right
; by 1 pixel when the user presses the left or right arrow key (respectively).
; It should ignore all other keys.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a number
;; interp. the x-coordinate of the dot

;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (on-key next-dot)
    (to-draw render-dot)))

;; next-dot : Dot KeyEv -> Dot
;; Given Dot and a key-event, produces the next Dot 
(check-expect (next-dot 10 "right") 11)
(check-expect (next-dot 10 "left") 9)

(define (next-dot d ke)
  (cond
    [(key=? ke "right") (add1 d)]
    [(key=? ke "left") (sub1 d)]
    [else d]))


;; render-dot : Dot -> Image
;; Given Dot, produces an image of the dot on the scene
(check-expect (render-dot 10)
              (place-image DOT 10 (/ (image-height SCENE) 2) SCENE))

(define (render-dot d)
  (place-image DOT d (/ (image-height SCENE) 2) SCENE))