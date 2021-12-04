;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2162) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.6.2
; Modify the animation of Exercise 21.6.1 so that if the x coordinate
; becomes less than 0, the direction switches to "right", and if the
; x coordinate becomes more than WIDTH, the direction switches to "left" —
; in other words, the picture “bounces” off the walls.


(require picturing-programs)

;; An animation of a dot moving across the screen with user input


;; -- Constants

;Scene
(define SCENE (empty-scene 500 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

(define-struct dot (pos vel))
;; Dot is (make-dot Natural Natural)
;; interp. the position and velocity (speed and direction) of the dot

(define DOT1 (make-dot 79 -2)) ; Dot at position 79 moving left at the speed of 2


;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (check-with dot?)
    (on-tick next-dot)
    (on-key change-direction)
    (to-draw render-dot)))


;; next-dot : Dot -> Dot
;; Given Dot, produces the next Dot based on position and velocity
(check-expect
 (next-dot (make-dot 50 2)) (make-dot 52 2))
(check-expect
 (next-dot (make-dot 50 -2)) (make-dot 48 -2))
(check-expect
 (next-dot (make-dot -1 -2)) (make-dot 0 2))
(check-expect
 (next-dot (make-dot (+ 1 (image-width SCENE)) 2)) (make-dot (image-width SCENE) -2))

(define (next-dot d)
  (cond
    [(< (dot-pos d) 0)
     (make-dot 0 (* (dot-vel d) -1))]
    [(> (dot-pos d) (image-width SCENE))
     (make-dot (image-width SCENE) (* (dot-vel d) -1))]
    [else
     (make-dot (+ (dot-pos d)(dot-vel d)) (dot-vel d))]))


;; change-direction : Dot KeyEvent -> Dot
;; Given a Dot and a key-event, changes the direction or speed of movement of the dot
(check-expect (change-direction (make-dot 50 2) "right") (make-dot 50 2))
(check-expect (change-direction (make-dot 50 2) "left") (make-dot 50 -2))
(check-expect (change-direction (make-dot 50 2) "up") (make-dot 50 2))
(check-expect (change-direction (make-dot 50 2) "down") (make-dot 50 2))

(define (change-direction d ke)
  (cond
    [(and (key=? ke "right") (< (dot-vel d) 0))
     (make-dot (dot-pos d) (* (dot-vel d) -1))]
    [(and (key=? ke "left") (> (dot-vel d) 0))
     (make-dot (dot-pos d) (* (dot-vel d) -1))]
    [else d]))


;; render-dot : Dot -> Image
;; Given Dot, produces the image of dot on the scene

(define (render-dot d)
  (place-image DOT (dot-pos d) (/ (image-height SCENE) 2) SCENE))


