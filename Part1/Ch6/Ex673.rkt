;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex673) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.7.3
; Develop an animation of a picture of your choice that moves to the
; right every second, moves down whenever the mouse moves, and resets to its starting
; position whenever somebody types on the keyboard.


(require picturing-programs)

;; -- Constants

; Width
(define WIDTH 500)

; Height
(define HEIGHT 300)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Image
(define BOOK pic:book)


;; -- Data Definition

;; MovingImage (MI) is a posn
;; interp. the x- and y- position of the mouse cursor

(define MI1 (make-posn 20 50))

#;
(define (fn-for-fi mi)
  (... (posn-x mi)     ;Number
       (posn-y mi)))   ;Number

;; Template rules used:
;;  - compound: 2 fields


;; -- Functions

;; Main

(define (main mi)
  (big-bang mi
    (on-tick next-mi 1)
    (on-mouse move-down)
    (on-key reset-mi)
    (to-draw render-mi)))


;; MI -> MI
(check-expect
 (next-mi MI1) (make-posn 23 50))
(check-expect
 (next-mi (make-posn 50 20)) (make-posn 53 20))

(define (next-mi mi)
  (make-posn (+ (posn-x mi) 3) (posn-y mi)))



;; MI Number Number MouseEv -> MI
(check-expect
 (move-down MI1 0 0 "move") (make-posn 20 53))
(check-expect
 (move-down MI1 0 0 "button-down") MI1)


(define (move-down mi x y me)
  (cond
    [(mouse=? me "move") (make-posn (posn-x mi) (+ (posn-y mi) 3))]
    [else mi]))


;; MI KeyEv -> MI
(check-expect (reset-mi MI1 " ") (make-posn 0 0))

(define (reset-mi mi ke)
  (make-posn 0 0))


;; MI -> Image
(check-expect
 (render-mi MI1)
 (place-image BOOK (posn-x MI1) (posn-y MI1) SCENE))


(define (render-mi mi)
  (place-image BOOK (posn-x mi) (posn-y mi) SCENE))







