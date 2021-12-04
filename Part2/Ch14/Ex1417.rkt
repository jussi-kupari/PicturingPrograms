;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1417) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 14.1.7
; Modify the animation of Exercise 6.7.2 or 6.7.3 so that the animation
; ends when the image (including white space) is wider or taller than the window.
; 
; In this case if the moving image is out of the scene



; Exercise 6.7.2
; Develop an animation of a picture of your choice that moves to the
; right every second, and moves down whenever somebody types on the keyboard.


(require picturing-programs)

;; -- Constants

; Width
(define WIDTH 100)

; Height
(define HEIGHT 100)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Image
(define BOOK pic:book)


;; -- Data Definition

;; MovingImage (MI) is a posn
;; interp. the x- and y- position of the mouse cursor

(define MI1 (make-posn 20 50))


;; -- Functions

;; Main

(define (main mi)
  (big-bang mi
    (on-tick next-mi .2)
    (on-key move-down)
    (to-draw render-mi)
    (stop-when out?)))


;; MI -> MI
(check-expect
 (next-mi MI1) (make-posn 23 50))
(check-expect
 (next-mi (make-posn 50 20)) (make-posn 53 20))

(define (next-mi mi)
  (make-posn (+ (posn-x mi) 3) (posn-y mi)))



;; MI KeyEv -> MI
(check-expect
 (move-down MI1 " ") (make-posn 20 53))
(check-expect
 (move-down MI1 "x") (make-posn 20 53))


(define (move-down mi ke)
  (cond
    [(key-event? ke) (make-posn (posn-x mi) (+ (posn-y mi) 3))]
    [else mi]))


;; MI -> Image
(check-expect
 (render-mi MI1)
 (place-image BOOK (posn-x MI1) (posn-y MI1) SCENE))


(define (render-mi mi)
  (place-image BOOK (posn-x mi) (posn-y mi) SCENE))


;; MI -> Boolean
;; Given MI, produce true if the image is out of the scene
(check-expect (out? (make-posn 100 100)) false)
(check-expect (out? (make-posn 140 100)) true)
(check-expect (out? (make-posn 100 140)) true)

(define (out? mi)
  (or (> (posn-x mi) (+ WIDTH (/ (image-width BOOK) 2)))
      (> (posn-y mi) (+ HEIGHT (/ (image-height BOOK) 2)))))




