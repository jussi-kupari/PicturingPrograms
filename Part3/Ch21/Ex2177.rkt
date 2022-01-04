;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2177) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.7
; Modify the animation of Exercise 21.7.6 so that if you press any of the
; arrow keys, it accelerates the dot in that direction (that is, it changes
; the velocity, not the location). You now have a rocket-ship simulation.

(require picturing-programs)

;; An animation of a dot moving on the scene and bouncing off walls

;; -- Constants

;Scene
(define WIDTH 200)
(define HEIGHT 200)
(define SCENE (empty-scene WIDTH HEIGHT))

;Dot
(define DOT (circle 5 "solid" "red"))

;; -- Data Definition

(define-struct dot (x y velx vely))
;; Dot is (make-dot Number Number Number Number)
;; interp. a Dot with xy-position and xy-velocity
;; velx < 0 left, velx > 0 right
;; vely < 0 up, vely > 0 down

(define DOTT (make-dot 100 100 0 0)) ;Dot at 50,50 going right at 5px/t and up at 2px/t

;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (check-with dot?)
    (on-tick next-dot)
    (on-key change-speed)
    (to-draw render-dot)))

;; next-dot : Dot -> Dot
;; Given Dot, produces the next Dot
(check-expect (next-dot (make-dot 0 0 0 0)) (make-dot 0 0 0 0))
(check-expect (next-dot (make-dot 20 30 5 5)) (make-dot 25 35 5 5))
(check-expect (next-dot (make-dot (+ WIDTH 1) 30 5 5)) (make-dot WIDTH 30 -5 5))
(check-expect (next-dot (make-dot -2 30 -5 5)) (make-dot 0 30 5 5))
(check-expect (next-dot (make-dot 20 (+ HEIGHT 1) 5 5)) (make-dot 20 HEIGHT 5 -5))
(check-expect (next-dot (make-dot 20 -2 5 -5)) (make-dot 20 0 5 5))

(define (next-dot d)
  (cond
    [(> (dot-x d) WIDTH)
     (make-dot WIDTH (dot-y d) (* (dot-velx d) -1) (dot-vely d))]
    [(< (dot-x d) 0)
     (make-dot 0 (dot-y d) (* (dot-velx d) -1) (dot-vely d))]
    [(> (dot-y d) HEIGHT)
     (make-dot (dot-x d) HEIGHT (dot-velx d) (* (dot-vely d) -1))]
    [(< (dot-y d) 0)
     (make-dot (dot-x d) 0 (dot-velx d) (* (dot-vely d) -1))]
    [else (make-dot (+ (dot-x d) (dot-velx d))
                    (+ (dot-y d) (dot-vely d))
                    (dot-velx d)
                    (dot-vely d))]))

;; change-speed : Dot KeyEvent -> Dot
;; Given a Dot and a key-event, produces the next Dot
(check-expect
 (change-speed DOTT "up")
 (make-dot (dot-x DOTT) (dot-y DOTT) (dot-velx DOTT) (sub1 (dot-vely DOTT))))
(check-expect
 (change-speed DOTT "down")
 (make-dot (dot-x DOTT) (dot-y DOTT) (dot-velx DOTT) (add1 (dot-vely DOTT))))
(check-expect
 (change-speed DOTT "left")
 (make-dot (dot-x DOTT) (dot-y DOTT) (sub1 (dot-velx DOTT)) (dot-vely DOTT)))
(check-expect
 (change-speed DOTT "right")
 (make-dot (dot-x DOTT) (dot-y DOTT) (add1 (dot-velx DOTT)) (dot-vely DOTT)))
(check-expect (change-speed DOTT " ") DOTT)

(define (change-speed d ke)
  (cond
    [(key=? ke "up")
     (make-dot (dot-x d) (dot-y d) (dot-velx d) (sub1 (dot-vely d)))]
    [(key=? ke "down")
     (make-dot (dot-x d) (dot-y d) (dot-velx d) (add1 (dot-vely d)))]
    [(key=? ke "left")
     (make-dot (dot-x d) (dot-y d) (sub1 (dot-velx d)) (dot-vely d))]
    [(key=? ke "right")
     (make-dot (dot-x d) (dot-y d) (add1 (dot-velx d)) (dot-vely d))]
    [else d]))

;; render-dot : Dot -> Image
;; Given Dot, produces an image of the Dot on the scene
(check-expect
 (render-dot DOTT)
 (place-image DOT (/ (image-width SCENE) 2) (/ (image-height SCENE) 2) SCENE))

(define (render-dot d)
  (place-image DOT (dot-x d) (dot-y d) SCENE))