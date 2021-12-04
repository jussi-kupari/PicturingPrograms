;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1725) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.2.5
; Modify the animation of Exercise 17.2.4 so each dot is green if it is
; within a distance of 50 pixels of the center of the window, and red if
; it is beyond that distance.


(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Center
(define CENTER-X (/ (image-width SCENE) 2))
(define CENTER-Y (/ (image-height SCENE) 2))

;; -- Data Definition

;; Img is an image
;; interp. the scene where dots are accumulating


;; -- Functions

;; main : Img -> Img
(define (main img)
  (big-bang img
    (on-tick update-scene)
    (to-draw render-scene)))


;; update-scene : Img -> Img
;; Given Img, produce the next Img

(define (update-scene img)
  (overlay (new-scene (random-pos img)) img))


;; random-pos : Img -> Img
;; Given and Img, produces a random position inside the image borders

(define (random-pos img)
  (make-posn (random (image-width img)) (random (image-height img))))


;; get-dot-color : Posn -> String
;; Given a position, produces the correct color ("red" or "green")
(check-expect (get-dot-color (make-posn 40 40)) "green")
(check-expect (get-dot-color (make-posn 10 10)) "red")

(define (get-dot-color pos)
  (if (< (distance-from-center pos) 50) "green" "red"))


;; Posn -> Number
;; Given Posn, produces the distace from center of scene
(check-expect (distance-from-center (make-posn 50 50)) 0)
(check-within (distance-from-center (make-posn 40 40)) 14 0.25)

(define (distance-from-center pos)
  (sqrt
   (+
    (sqr (- (posn-x pos) CENTER-X))
    (sqr (- (posn-y pos) CENTER-Y)))))




;; new-scene : Posn -> Img
;; Given a Posn, produces a new scene with a correct dot

(define (new-scene pos)
  (place-image
   (circle 2 "solid" (get-dot-color pos))
   (posn-x pos)
   (posn-y pos)
   (rectangle (image-width SCENE) (image-height SCENE) "outline" "black")))

;; render-scene : Img -> Img
;; Given Img, produce the same Img

(define (render-scene img) img)




