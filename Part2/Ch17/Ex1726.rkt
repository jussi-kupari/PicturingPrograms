;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1726) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.2.6
; Modify one of your previous animations by placing a rectangular “Quit”
; button (a rectangle overlaid with the text “Quit”) near the bottom of the
; window. If the user moves or clicks the mouse inside the button, stop the
; animation. (We’ll see in chapter 18 how to respond only to mouse-clicks.)
; 
; Hint: You might want to write a helper function in-quit-button? which takes
; in the x and y coordinates of the mouse and tells whether they represent
; a point inside the rectangle where you put the “Quit” button.
; 
; ________________________________________________________________________
; 
; This program stops when the mouse cursor hits dead center in the scene
; 


(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))


;; -- Data Definition

;; Dot is a posn (make-posn x y)
;; interp. the x and y position of the mouse cursor

;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (on-mouse next-dot)
    (to-draw render-dot)
    (stop-when dot-at-center?)))


;; next-dot : Dot Number Number MouseEv -> Dot
;; Given Dot x and y of mouse and a mouse event
;; produces the next Dot
(check-expect (next-dot (make-posn 0 0) 10 10 "move") (make-posn 10 10))


(define (next-dot d x y me)
  (make-posn x y))


;; render-dot : Dot -> Image
;; Given Dot, produces the image of the Dot
(check-expect (render-dot (make-posn 27 45))
              (place-image (circle 5 "solid" "green") 27 45 SCENE))
(check-expect (render-dot (make-posn 100 36))
              (place-image (circle 5 "solid" "red") 100 36 SCENE))
(check-expect (render-dot (make-posn 45 45))
              (place-image (circle 5 "solid" "red") 45 45 SCENE))

(define (render-dot d)
  (place-image
   (circle 5 "solid" (dot-color d))
   (posn-x d)
   (posn-y d)
   SCENE))

;; dot-color : Dot -> String
;; Given a Dot, produces the correct color as a string ("red" or "green")
(check-expect (dot-color (make-posn 20 10)) "red")
(check-expect (dot-color (make-posn 10 20)) "green")
(check-expect (dot-color (make-posn 10 10)) "red")

(define (dot-color d)
  (cond
    [(>= (posn-x d) (posn-y d)) "red"]
    [(< (posn-x d) (posn-y d)) "green"]))


;; dot-at-center? : Dot -> Boolean
;; Given Dot, produce true if the dot is at the center of the scene
(check-expect (dot-at-center? (make-posn 50 50)) true)
(check-expect (dot-at-center? (make-posn 30 70)) false)

(define (dot-at-center? d)
  (equal? d (make-posn (/ (image-width SCENE) 2) (/ (image-height SCENE) 2))))