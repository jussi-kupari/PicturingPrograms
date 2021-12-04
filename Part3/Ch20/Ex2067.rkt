;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2067) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.6.7
; Modify Exercise 20.6.1 or 20.6.3 so that the display is a green dot
; if it’s within 50 pixels from the center of the window
; (i.e. (make-posn (/ WIDTH 2) (/HEIGHT 2)), and a red dot if it’s farther away.
; Hint: Re-use a function we’ve seen earlier in this chapter.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dots
(define RED (circle 5 "solid" "red"))
(define GREEN (circle 5 "solid" "green"))

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
(check-expect (render-dot (make-posn 10 0)) (place-image RED 10 0 SCENE))
(check-expect (render-dot (make-posn 40 40)) (place-image GREEN 40 40 SCENE))

(define (render-dot d)
  (cond
    [(> (distance-from-center d) 50)
     (place-image RED (posn-x d) (posn-y d) SCENE)]
    [else
     (place-image GREEN (posn-x d) (posn-y d) SCENE)]))



;; distance-from-center : Posn -> Number
;; Given a Posn, produces the distance from the center of the scene
(check-expect (distance-from-center (make-posn 50 50)) 0)
(check-within (distance-from-center (make-posn 45 45)) 7.07 0.2)
(check-within (distance-from-center (make-posn 55 55)) 7.07 0.2)

(define (distance-from-center d)
  (sqrt
   (+
    (sqr (- (posn-x d) (/ (image-width SCENE) 2)))
    (sqr (- (posn-y d) (/ (image-height SCENE) 2))))))







