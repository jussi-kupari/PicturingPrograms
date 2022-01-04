;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2163) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.6.3
; Modify the animation of Exercise 20.6.4 so that it keeps track of how
; many clicks you’ve done before successfully clicking on a dot. Once you do, it should
; replace the contents of the animation window with something like "Congratulations!
; It took you 13 clicks to hit a dot."

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))

;; -- Data Definition

(define-struct dotcount (x y count))
;; DotCount is (make dotcount Number Number Natural)
;; interp. the (x,y) position of the dot and number of clicks done

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
  (make-dotcount (random (image-width SCENE))
                 (random (image-height SCENE))
                 (dotcount-count d)))

;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-dotcount 0 0 5)) (place-image DOT 0 0 SCENE))

(define (render-dot d)
  (place-image DOT (dotcount-x d) (dotcount-y d) SCENE))

;; hit-the-dot : DotCount Number Number MouseEv -> DotCount or stop
;; Given a DotCount, mouse xy and mouse-event, new Dot or stop the animation

(define (hit-the-dot d x y me)
  (cond
    [(and (mouse=? me "button-down")
          (= x (dotcount-x d))
          (= y (dotcount-y d)))
     (stop-with
      (text
       (string-append "Congratulations, you hit the dot with "
                      (number->string (add1 (dotcount-count d)))
                      " clicks!") 30 "orange"))]
    [(mouse=? me "button-down")
     (make-dotcount (dotcount-x d) (dotcount-y d) (add1 (dotcount-count d)))]
    [else d]))