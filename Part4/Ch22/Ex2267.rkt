;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2267) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 22.6.7
Develop an animation similar to Exercise 20.6.4, but every few seconds a dot is added to the screen
(in addition to whatever dots are already there), and if you click inside any of the existing dots,
the game ends. (The game will be easy to win, since pretty soon the screen fills with dots so it’s
hard not to hit one.) Hint: Use a list of posns as the model.
__

Finding the solution doesn't seem trivial here.
Mine is a bit hacky, but I can't figure out a more obvious solution.|#

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 200 200))

;Dot
(define DOT (circle 10 "solid" "red"))

;; -- Data Definition

;; LPOS is one of:
;; - empty
;; - (cons Posn LPOS)
;; interp. a list of Posns

;; -- Functions

;; main : LPOS -> LPOS
;; initiate world with (main empty)

(define (main lpos)
  (big-bang lpos
    (on-tick next-lpos 1)
    (stop-when hit-found?)
    (to-draw render-lpos)
    (on-mouse hit-dot)))

;; next-lpos : LPOS -> LPOS
;; Given LPOS, produces a new LPOS with a new Posn with random x and y

(define (next-lpos lpos)
  (cons (make-posn (random (image-width SCENE))
                   (random (image-height SCENE)))
        lpos))

;; render-lpos : LPOS -> Image
;; Given LPOS, produces an image of dots on the scene according to all the Posns in the list
(check-expect (render-lpos empty) SCENE)
(check-expect
 (render-lpos (cons (make-posn 70 70) (cons (make-posn 50 50) empty)))
 (place-image DOT 70 70 (place-image DOT 50 50 SCENE)))

(define (render-lpos lpos)
  (cond
    [(empty? lpos) SCENE]
    [else
     (place-image DOT (posn-x (first lpos)) (posn-y (first lpos))
                  (render-lpos (rest lpos)))]))

;; hit-dot : LPOS Number Number MouseEv -> LPOS
;; Given LPOS mouse xy and mouse-event, produces an "special" posn in LPOS if hit occurs

(define (hit-dot lpos x y me)
  (cond
    [(empty? lpos) empty]
    [else (if (not (hit? (first lpos) x y me))
              (cons (first lpos) (hit-dot (rest lpos) x y me))
              (cons (make-posn (add1 (image-width SCENE))
                               (add1 (image-height SCENE)))
                    (hit-dot (rest lpos) x y me)))]))

;; hit-found? : LPOS -> Boolean
;; Given LPOS, produces true if a hit has occurred ("special" Posn is found)

(define (hit-found? lpos)
  (cond
    [(empty? lpos) false]
    [else
     (if
      (equal? (make-posn (add1 (image-width SCENE))
                         (add1 (image-height SCENE)))
              (first lpos))
      true
      (hit-found? (rest lpos)))]))

;; hit? : Posn Number Number MouseEvent -> Boolean
;; Given a Posn mouse xy and mouse-event, produces true if cursor xy match Posn and "button-down"
(check-expect (hit? (make-posn 0 0) 0 0 "button-down") true)
(check-expect (hit? (make-posn 0 0) 10 10 "button-down") false)
(check-expect (hit? (make-posn 0 0) 0 0 "move") false)

(define (hit? posn x y me)
  (and (mouse=? me "button-down")
       (= x (posn-x posn))
       (= y (posn-y posn))))