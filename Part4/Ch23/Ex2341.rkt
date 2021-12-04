;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2341) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.4.1
Write an animation of a bunch of balls, each moving around the screen with constant velocity
and bouncing off walls. Pressing the + key should create one more ball, with random initial
location (inside the animation window) and random velocity (say, from -10 to +10 in each dimension).
Pressing the - key should remove the most recently-added ball, unless there are no balls, in which
case it should do nothing. Clicking with the mouse inside a ball should remove the ball you clicked
on, leaving the rest of the balls unchanged.

Hint: You’ll need each ball to have a location and a velocity, as in exercise 21.7.6, and
use a list of structs as your model, as in exercise 22.6.7.

Hint: What should happen if you click with the mouse in a place where two or more
balls overlap? The assignment doesn’t say exactly, so you should decide in advance what
you want to happen in this case, and make it work.

Note: I made mine to respond to "dragging" (= moving with button down) not clicking|#

(require picturing-programs)

;; -- Constants

;Scene
(define WIDTH 500)
(define HEIGHT 500)
(define SCENE (empty-scene WIDTH HEIGHT))

;Ball
(define BALL (circle 10 "solid" "red"))


;; -- Data Definitions

(define-struct ball (x y velx vely))
;; Dot is (make-ball Number Number Number Number)
;; interp. a Ball with xy-position and xy-velocity
;; velx < 0 left, velx > 0 right
;; vely < 0 up, vely > 0 down

(define BALL1 (make-ball 50 50 -10 5)) ;Ball at [50, 50] going right at 5px/t and up at 2px/t

;; LOB (List-Of-Balls) is one of:
;; - empty
;; - (cons Ball LOB)
;; interp. a list of Balls

(define LOB1 (cons (make-ball 50 50 -10 -5)
                   (cons (make-ball 70 50 -5 5)
                         (cons (make-ball 100 40 10 5) empty))))


;; -- Functions

;; main
;; inititate with (main LOB1)

(define (main lob)
  (big-bang lob
    (on-tick next-lob)
    (on-key modify-lob)
    (to-draw render-lob)
    (on-mouse remove-if-hit)
    (stop-when no-balls?)))

;; next-lob : LOB -> LOB
;; Given a LOB, produces and updated LOB based on the positions and velocities of the balls
(check-expect (next-lob empty) empty)
(check-expect (next-lob (cons (make-ball (add1 WIDTH) 50 10 10) empty))
              (cons (make-ball WIDTH 50 -10 10) empty))


(define (next-lob lob)
  (cond
    [(empty? lob) empty]
    [else
     (cons (if (within-scene? (first lob))
               (next-ball (first lob))
               (bounce (first lob)))
           (next-lob (rest lob)))]))


;; next-ball : Ball -> Ball
;; Given a Ball, produces the ball with updated location
(check-expect (next-ball (make-ball 50 50 -10 5)) (make-ball 40 55 -10 5))

(define (next-ball b)
  (make-ball (+ (ball-x b) (ball-velx b))
             (+ (ball-y b) (ball-vely b))
             (ball-velx b)
             (ball-vely b)))

;; within-scene? : Ball Number Number -> Boolean
;; Given a Ball and width and height of scene, produces true if ball location is within the scene
(check-expect (within-scene? (make-ball 50 50 10 10)) true)
(check-expect (within-scene? (make-ball WIDTH HEIGHT 10 10)) true)
(check-expect (within-scene? (make-ball (add1 WIDTH) HEIGHT 10 10)) false)
(check-expect (within-scene? (make-ball WIDTH (add1 HEIGHT) 10 10)) false)
(check-expect (within-scene? (make-ball -1 HEIGHT 10 10)) false)

(define (within-scene? b)
  (and (<= 0 (ball-x b) WIDTH)
       (<= 0 (ball-y b) HEIGHT)))


;; bounce : Ball -> Ball
;; Given a Ball, reverses the velocity of the dimension that is beyond limits of the scene
(check-expect (bounce (make-ball WIDTH 100 10 10)) (make-ball WIDTH 100 10 10))
(check-expect (bounce (make-ball (+ WIDTH 1) 100 10 10)) (make-ball WIDTH 100 -10 10))
(check-expect (bounce (make-ball -1 100 -10 10)) (make-ball 0 100 10 10))
(check-expect (bounce (make-ball 0 100 -10 10)) (make-ball 0 100 -10 10))


(define (bounce b)
  (cond
    [(> (ball-x b) WIDTH)
     (make-ball WIDTH (ball-y b) (* (ball-velx b) -1) (ball-vely b))]
    [(< (ball-x b) 0)
     (make-ball 0 (ball-y b) (* (ball-velx b) -1) (ball-vely b))]
    [(> (ball-y b) HEIGHT)
     (make-ball (ball-x b) HEIGHT (ball-velx b) (* (ball-vely b) -1))]
    [(< (ball-y b) 0)
     (make-ball (ball-x b) 0 (ball-velx b) (* (ball-vely b) -1))]
    [else b]))


;; modify-lob : LOB KeyEvent -> LOB
;; Given a LOB and a key-event ("+" or "-") adds or removes a ball from the list end of the LOB

(define (modify-lob lob ke)
  (cond
    [(empty? lob) empty]
    [(and (key-event? ke) (key=? ke "+"))
     (cons (make-ball (random WIDTH)
                      (random HEIGHT)
                      (random 10)
                      (random 10)) lob)]
    [(and (key-event? ke) (key=? ke "-"))
     (rest lob)]))

;; render-lob : LOB -> Image
;; Given a LOB, produces an image of the scene with all the balls of the LOB in it
(check-expect (render-lob empty)
              SCENE)
(check-expect (render-lob (cons (make-ball 50 50 0 0) empty))
              (place-image BALL 50 50 SCENE))
(check-expect (render-lob
               (cons (make-ball 50 50 0 0)
                     (cons (make-ball 70 80 -4 7) empty)))
              (place-image BALL 70 80 (place-image BALL 50 50 SCENE)))


(define (render-lob lob)
  (cond
    [(empty? lob) SCENE]
    [else
     (place-image BALL (ball-x (first lob)) (ball-y (first lob))
                  (render-lob (rest lob)))]))


;; remove-if-hit : LOB Number Number MouseEvent -> LOB
;; Given a LOB, mouse xy and a mouse-event, if the cursor hits the ball, removes the ball from the list
(check-expect (remove-if-hit (cons
                              (make-ball 50 50 0 0) empty) 10 10 "move")
              (cons
               (make-ball 50 50 0 0) empty))

(check-expect (remove-if-hit (cons
                              (make-ball 50 50 0 0)
                              (cons (make-ball 10 10 10 10) empty)) 10 10 "drag")
              (cons (make-ball 50 50 0 0) empty))

(define (remove-if-hit lob x y me)
  (cond
    [(empty? lob) empty]
    [else
     (if (hit? (first lob) x y me)
         (remove-if-hit (rest lob) x y me)
         (cons (first lob) (remove-if-hit (rest lob) x y me)))]))


;; hit? : Ball Number Number MouseEvent -> LOB
;; Given a Ball, mouse xy and a mouse-event, produces true if the cursor hits the ball
(check-expect (hit? (make-ball 50 50 0 0) 10 10 "drag") false)
(check-expect (hit? (make-ball 50 50 0 0) 50 50 "drag") true)
(check-expect (hit? (make-ball 50 50 0 0) 50 50 "move") false)

(define (hit? b x y me)
  (and (mouse=? me "drag")
       (= (ball-x b) x)
       (= (ball-y b) y)))

;; no-balls : LOB -> Boolean
;; Given a LOB, produces true if the list is empty
(check-expect (no-balls? empty) true)
(check-expect (no-balls? (cons (make-ball 50 50 -10 -5) empty)) false)

(define (no-balls? lob)
  (empty? lob))





