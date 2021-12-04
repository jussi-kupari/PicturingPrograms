;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2069) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.6.9
; Modify Exercise 20.6.1 so that if the dot reaches an edge of the
; window, it “wraps around”. That is, if it’s at x coordinate 0, and tries to move left,
; its x coordinate becomes WIDTH. If it’s at x coordinate WIDTH and tries to move right,
; its x coordinate becomes 0. Likewise, if the y coordinate is 0 and it tries to move up,
; the y coordinate becomes HEIGHT, while if the y coordinate is HEIGHT and the dot tries
; to move down, it jumps to y coordinate 0.
; 
; Hint: It may be easiest to just move the posn, without worrying about whether it’s
; outside the window, and then call a helper function that takes in the “attempted”
; position of the dot and returns a “corrected” position with
; 0 ≤ x ≤ WIDTH and 0 ≤ y ≤ HEIGHT.

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
    (on-key next-dot)
    (to-draw render-dot)))

;; next-dot : Dot KeyEv -> Dot
;; Given Dot and a key-event, produces the next dot
(check-expect (next-dot (make-posn 0 0) "down") (make-posn 0 1))
(check-expect (next-dot (make-posn 0 0) "up") (make-posn 0 100))
(check-expect (next-dot (make-posn 0 0) "left") (make-posn 100 0))
(check-expect (next-dot (make-posn 0 0) "right") (make-posn 1 0))
(check-expect (next-dot (make-posn 0 0) " ") (make-posn 0 0))

(define (next-dot d ke)
  (cond
    [(key=? ke "up") (if (< (sub1 (posn-y d)) 0)
                         (make-posn (posn-x d) (image-height SCENE))
                         (make-posn (posn-x d) (sub1 (posn-y d))))]
    [(key=? ke "down") (if (> (add1 (posn-y d)) (image-height SCENE))
                           (make-posn (posn-x d) 0)
                           (make-posn (posn-x d) (add1 (posn-y d))))]
    [(key=? ke "left") (if (< (sub1 (posn-x d)) 0)
                           (make-posn (image-width SCENE) (posn-y d))
                           (make-posn (sub1 (posn-x d)) (posn-y d)))]
    [(key=? ke "right") (if (> (add1 (posn-x d)) (image-width SCENE))
                            (make-posn 0 (posn-y d))
                            (make-posn (add1 (posn-x d)) (posn-y d)))]
    [else d]))



;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-posn 45 34)) (place-image DOT 45 34 SCENE))

(define (render-dot d)
  (place-image DOT (posn-x d) (posn-y d) SCENE))