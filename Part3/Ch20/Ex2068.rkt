;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2068) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.6.8
; Modify Exercise 20.6.1 so that in addition to responding to arrow
; keys, the dot moves slowly and randomly around the screen every half second: with equal
; probability, it moves up one pixel, down one pixel, left one pixel, or right one pixel.
; 
; Hint: You’ll obviously need to use random. Since all four random choices result in
; adding something to the current posn, you could write a helper function choose-offset
; that takes in a number (either 0, 1, 2, or 3) and returns the appropriate posn to add.
; Alternatively, you could write a function random-offset that takes in a dummy parameter,
; ignores it, picks a random number (either 0, 1, 2, or 3), and returns the appropriate
; posn to add. The latter approach is easier to use, but harder to test.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a posn
;; interp. the x,y coordinates of a red dot on the scene


;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (check-with posn?)
    (on-tick random-move 1/2)
    (on-key next-dot)
    (to-draw render-dot)))

;; next-dot : Dot KeyEv -> Dot
;; Given Dot and a key-event. produces the next dot
(check-expect (next-dot (make-posn 0 0) "down") (make-posn 0 1))
(check-expect (next-dot (make-posn 0 0) "up") (make-posn 0 -1))
(check-expect (next-dot (make-posn 0 0) "left") (make-posn -1 0))
(check-expect (next-dot (make-posn 0 0) "right") (make-posn 1 0))
(check-expect (next-dot (make-posn 0 0) " ") (make-posn 0 0))


;; random-move : Dot -> Dot
;; Given Dot, produces the next Dot using a random move
(check-member-of (random-move (make-posn 0 0))
                    (make-posn  1  0)
                    (make-posn -1  0)
                    (make-posn  0  1)
                    (make-posn  0 -1))

(define (random-move d)
  (cond
    [(= (random 4) 0) (make-posn (posn-x d) (add1 (posn-y d)))]
    [(= (random 3) 0) (make-posn (posn-x d) (sub1 (posn-y d)))]
    [(= (random 2) 0) (make-posn (add1 (posn-x d)) (posn-y d))]
    [else (make-posn (sub1 (posn-x d)) (posn-y d))]))


(define (next-dot d ke)
  (cond
    [(key=? ke "up") (make-posn (posn-x d) (sub1 (posn-y d)))]
    [(key=? ke "down") (make-posn (posn-x d) (add1 (posn-y d)))]
    [(key=? ke "left") (make-posn (sub1 (posn-x d)) (posn-y d))]
    [(key=? ke "right") (make-posn (add1 (posn-x d)) (posn-y d))]
    [else d]))

;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-posn 45 34)) (place-image DOT 45 34 SCENE))

(define (render-dot d)
  (place-image DOT (posn-x d) (posn-y d) SCENE))