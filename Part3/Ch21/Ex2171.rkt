;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2171) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.1
; 
; In Exercise 21.6.3,
; you probably defined a struct with three fields: x, y, and clicks.
; Two of the three happen to be the exact same fields as in a posn, so an alternative way
; to define this struct would be as two fields, one of which is a posn.
; 
; Modify the animation of Exercise 21.6.3 to use this sort of a model.
; It should behave exactly as before. Is the code shorter or longer? Easier or harder to
; understand?
; (If you did Exercise 21.6.3 using a nested struct, try it with three fields instead.
; Is the code shorter or longer? Easier or harder to understand?)

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 100 100))

;Dot
(define DOT (circle 5 "solid" "red"))

;; -- Data Definition

(define-struct dotcount (posn count))
;; DotCount is (make dotcount (make-posn Number Number) Number Natural)
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
  (make-dotcount (make-posn (random (image-width SCENE))
                            (random (image-height SCENE)))
                 (dotcount-count d)))

;; render-dot : Dot -> Image
;; Given a Dot, produces an image of the dot on the scene
(check-expect (render-dot (make-dotcount (make-posn 0 0) 5)) (place-image DOT 0 0 SCENE))

(define (render-dot d)
  (place-image DOT (posn-x (dotcount-posn d)) (posn-y (dotcount-posn d)) SCENE))

;; hit-the-dot : DotCount Number Number MouseEv -> DotCount or stop
;; Given a DotCount, mouse xy and mouse-event, new Dot or stop the animation

(define (hit-the-dot d x y me)
  (cond
    [(and (mouse=? me "button-down")
          (= x (posn-x (dotcount-posn d)))
          (= y (posn-y (dotcount-posn d))))
     (stop-with
      (text
       (string-append "Congratulations, you hit the dot with "
                      (number->string (add1 (dotcount-count d)))
                      " clicks!") 30 "orange"))]
    [(mouse=? me "button-down")
     (make-dotcount
      (make-posn (posn-x (dotcount-posn d))
                 (posn-y (dotcount-posn d)))
      (add1 (dotcount-count d)))]
    [else d]))