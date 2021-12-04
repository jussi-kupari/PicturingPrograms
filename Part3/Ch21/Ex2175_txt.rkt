;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2175_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.5
; Write an animation in which a particular (small) picture moves with the mouse
; over a (large) background picture, and every time the user clicks and releases
; the mouse button, the small picture is added to the background picture at that
; location. For example, if the small picture were a smiley-face, you could place
; a bunch of smiley-faces in various places around the background picture, with a
; smiley-face always moving with the mouse so you can see what it’ll look like in
; advance.
; 
; .
; 
; Example of outcome:
; .

(require picturing-programs)

;; An animation of a scheme-logo moving on the scene with the cursor
;; mouse-click adds a logo on the spot

;; -- Constants

;Scene
(define SCENE (empty-scene 200 200))

;Scheme-logo
(define LOGO pic:scheme-logo)


;; -- Data Definition


(define-struct world (scene pos))
;; World is (make-world Image (make-posn Number Number)
;; interp.  The World containing the current scene-image and xy of the cursor

(define WORLD
  (make-world
   (empty-scene 200 200)
   (make-posn (/ (image-width SCENE) 2)
              (/ (image-height SCENE) 2))))



;; -- Functions

;; main : World -> World
;; intitiate World with (main WORLD)
(define (main w)
  (big-bang w
    (check-with world?)
    (on-mouse next-world)
    (to-draw render-world)))



;; next-world : World MouseEvent -> World
;; Given World and mouse-event, produce next world
(check-expect
 (next-world WORLD 70 70 "button-up")
 (make-world (place-image LOGO 70 70 SCENE) (make-posn 70 70)))

(check-expect
 (next-world WORLD 70 70 "button-down")
 (make-world SCENE (make-posn 70 70)))

(define (next-world w x y me)
  (cond
    [(mouse=? me "button-up")
     (make-world (place-image LOGO x y (world-scene w)) (make-posn x y))]
    [else
     (make-world (world-scene w) (make-posn x y))]))



;; render-world : World -> Image
;; Given World, produces and image of world-scene with logo at the cursor position
(check-expect (render-world WORLD) (place-image LOGO 100 100 SCENE))

(define (render-world w)
  (place-image LOGO
               (posn-x (world-pos w))
               (posn-y (world-pos w))
               (world-scene w)))
















