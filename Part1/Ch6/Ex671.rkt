;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex671) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.7.1
; Modify the animation of Exercise 6.6.3 so the picture slides left and
; right with the mouse, but stays at the same vertical position — say, halfway down the
; window — regardless of the mouse’s vertical position.


(require picturing-programs)

;; Animation of a picture moving around with the mouse cursor

;; -- Constants

; Width
(define WIDTH 500)

; Height
(define HEIGHT 300)

; y-position
(define Y (/ HEIGHT 2))

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Image
(define BOOK pic:book)


;; -- Data Definition

;; FlyingImage (FI) is a posn
;; interp. the x- and y- position of the mouse cursor

(define FI1 (make-posn 20 Y))

#;
(define (fn-for-fi fi)
  (... (posn-x fi)     ;Number
       (posn-y fi)))   ;Number

;; Template rules used:
;;  - compound: 2 fields


;; -- Functions


;; FI -> FI
;; main function (start main (make-posn 0 0))


(define (main fi)
  (big-bang fi
  (on-mouse next-fi)
  (to-draw render-fi)))


;; FI Number Number MouseEv -> FI
;; produce the next FI at the cursor
(check-expect (next-fi FI1 10  10 "move") (make-posn  10  Y))
(check-expect (next-fi FI1 100 200 "move") (make-posn 100 Y))
(check-expect (next-fi FI1 10  10 "button-down") FI1)
(check-expect (next-fi FI1 100 200 "drag") FI1)

;(define (next-fi x y me) (make-posn 0 0)) ; stub

(define (next-fi fi x y me)
  (cond
    [(mouse=? me "move") (make-posn x Y)]
    [else fi]))  


;; FI -> Image
;; create image of the world state
(check-expect (render-fi FI1) (place-image BOOK 20 Y SCENE))

;(define (render-fi fi) (place-image BOOK 0 0 SCENE)) ;stub

(define (render-fi fi)
  (place-image BOOK (posn-x fi) (posn-y fi) SCENE))





