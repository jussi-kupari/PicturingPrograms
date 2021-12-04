;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1724) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.2.4
; Write an animation a bit like Exercise 8.5.3 and a bit like Exer-
; cise 17.2.2: at every time interval, it adds a dot at a random location,
; but the dot should be red if x > y and green otherwise.
; 
; Not very happy with this solution.
; 
; I had to use a globally defined image as the scene b/c
; I couldn't figure out the scoping otherwise.
; 


(require picturing-programs)

;; -- Constants

;Scene
(define SCENE pic:bloch)


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
(check-expect (get-dot-color (make-posn 10 9)) "red")
(check-expect (get-dot-color (make-posn 9 10)) "green")

(define (get-dot-color pos)
  (if (> (posn-x pos) (posn-y pos)) "red" "green"))


;; new-scene : Posn -> Img
;; Given a Posn, produces a new scene with a correct dot

(define (new-scene pos)
  (place-image
   (circle 3 "solid" (get-dot-color pos))
   (posn-x pos)
   (posn-y pos)
   (rectangle (image-width SCENE) (image-height SCENE) "outline" "black")))


;; render-scene : Img -> Img
;; Given Img, produce the same Img

(define (render-scene img) img)




