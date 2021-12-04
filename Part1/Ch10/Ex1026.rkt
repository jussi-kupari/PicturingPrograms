;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1026) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 10.2.6
; Develop an animation that, at all times, shows the mouse’s
; coordinates as an ordered pair in the animation window.
; For example, if the mouse were currently 17 pixels from
; the left and 43 pixels down from the top, the screen would
; show (17, 43)

(require picturing-programs)

;; An indicator of mouse's position on the scene

;; -- Constants

;Scene
(define SCENE (empty-scene 500 500))


;; -- Data Definition

;; MousePosition is a posn
;; interp. as the x,y position of mouse cursor

(define MP1 (make-posn 100 100))


;; -- Functions

;; MP -> MP
;; initialize with (main (make-posn 0 0))

(define (main mp)
  (big-bang mp
    (on-mouse update-position)
    (to-draw render-position)))


;; MP Natural Natural MouseEv -> MP
;; Given MP mouse position and mouseEv, make new position
(check-expect
 (update-position (make-posn 0 0) 100 100 "move") (make-posn 100 100))

(check-expect
 (update-position (make-posn 0 0) 100 100 "button-down") (make-posn 0 0))

(define (update-position mp x y me)
  (cond
    [(mouse=? "move" me) (make-posn x y)]
    [else mp]))


;; MP -> Image
;; Given MP, produce image at the correct position

(define (render-position mp)
  (place-image
   (render-cursor mp) (posn-x mp) (posn-y mp)
   SCENE))


;; MP -> Image
;; Given mouse position, produce image of cursor

(define (render-cursor mp)
  (text (string-append
         (number->string (posn-x mp))
         ", "
         (number->string (posn-y mp)))
        18 "blue"))
