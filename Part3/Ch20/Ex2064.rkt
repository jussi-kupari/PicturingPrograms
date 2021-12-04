;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2064) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.6.4
; Modify Exercise 20.6.3 so that if the user clicks the mouse on the
; dot (i.e. within a distance of 3 from its current center), the animation ends with the
; message “Congratulations!” This forms a sort of video-game, which will get harder if you
; shorten the time between ticks.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))


;; -- Data Definition

;; Dot is a posn
;; interp. the (x,y) position of the dot


;; -- Functions

;; main : Dot -> Dot
(define (main d)
  (big-bang d
    (on-tick next-dot 2)
    (to-draw render-dot)
    (on-mouse hit-the-dot)))

;; next-dot : Dot -> Dot
;; Given Dot, produces the next dot with random (x,y) within the scene

(define (next-dot d)
  (make-posn (random (image-width SCENE))
             (random (image-height SCENE))))


;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-posn 0 0)) (place-image DOT 0 0 SCENE))

(define (render-dot d)
  (place-image DOT (posn-x d) (posn-y d) SCENE))


;; hit-the-dot : Posn Number Number MouseEv -> Posn or stop
;; Given a posn, mouse xy and mouse-event, continue or stop the animation
(check-expect
 (hit-the-dot (make-posn 0 0) 0 0 "button-down") (stop-with
                             (text
                              "Congratulations, you hit the dot!"
                              30 "green")))
(check-expect
 (hit-the-dot (make-posn 0 0) 0 0 "button-up") (make-posn 0 0))
(check-expect
 (hit-the-dot (make-posn 60 70) 0 0 "button-down") (make-posn 60 70))

(define (hit-the-dot d x y me)
  (cond
    [(and (mouse=? me "button-down")
          (= x (posn-x d))
          (= y (posn-y d))) (stop-with
                             (text
                              "Congratulations, you hit the dot!"
                              30 "green"))]
    [else d]))


