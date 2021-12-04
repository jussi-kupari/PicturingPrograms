;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1814) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 18.1.1
; Write an animation that starts with a blank screen, and adds a small dot at
; the mouse location every time the mouse button is pressed.
; 
;  ------
; 
; Exercise 18.1.2 Modify this animation so it adds a dot whenever the mouse button
; is released, rather than whenever it is pressed. As a user, do you like this
; version better or worse?
; 
;  ------
; 
; Exercise 18.1.3
; Modify this animation so it adds a dot whenever the mouse is dragged
; (i.e. moved while holding the mouse button down). The result should
; be a sort of “sketch-pad” program in which you can draw lines and curves
; with the mouse.
; 
;  ------
; 
; Exercise 18.1.4
; Modify this animation so it adds a green dot whenever the mouse
; button is pressed, and a red dot whenever the mouse button is released.



(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 500 500))

;Dots
(define GREEN (circle 5 "solid" "green"))
(define RED (circle 5 "solid" "red"))

;; -- Data Definition

;; Scene is an Image
;; iterp. an image where dots appear on mouse clicks


;; -- Functions

;; main : Scene -> Scene
(define (main sc)
  (big-bang sc
    (on-mouse add-dot)
    (to-draw render-scene)))


;; add-dot : Scene Number Number MouseEv -> Scene
;; Given a scene, x and y of mouse and mouse event ("button down")
;; produces a new scene with an added red dot at the cursor position
(check-expect (add-dot SCENE 20 40 "button-down")(place-image GREEN 20 40 SCENE))
(check-expect (add-dot SCENE 20 40 "button-up")(place-image RED 20 40 SCENE))
(check-expect (add-dot SCENE 20 40 "enter") SCENE)

(define (add-dot sc x y me)
  (cond
    [(mouse=? me "button-down") (place-image GREEN x y sc)]
    [(mouse=? me "button-up") (place-image RED x y sc)]
    [else sc]))


;; render-scene : Scene -> Scene
;; Given scene, produces an image of the scene
(check-expect (render-scene SCENE) SCENE)

(define (render-scene sc) sc)