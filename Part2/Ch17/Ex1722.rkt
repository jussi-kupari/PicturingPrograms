;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1722) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.2.2
; Write an animation that places a dot at the mouse location every
; time the mouse is moved or clicked. The color of this dot should
; be red if the x coordinate is more than the y coordinate, and green
; otherwise.
; 
; NOTE: I used a compound structure (posn) to solve this problem.
; 
; Hint: You may find that the answer s in this conditional are two
; complex expressions,exactly the same except for the color. You
; can make your function shorter and simpler by moving the conditional
; inside this expression, so the answers in the conditional are
; just color names.

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
    (to-draw render-dot)))


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