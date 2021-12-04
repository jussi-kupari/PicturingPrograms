;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2072) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.7.2
; Write an animation that displays a large disk whose color changes
; with the clock and the mouse position: the x coordinate of the mouse should control the
; amount of red, the y coordinate should control the amount of blue, and the clock should
; control the amount of green.
; 
; Hint: As in Section 7.8.3, use min to make sure you never pass numbers larger than
; 255 to make-color.
; There’s a built-in function color? which tells whether something is a color, and a
; built-in function color=? which tells whether two colors are the same.

(require picturing-programs)

;; -- Constants


;; -- Functions

;; main : Color -> Color
(define (main c)
  (big-bang c
    (check-with color?)
    (on-tick next-green)
    (on-mouse next-color)
    (to-draw render-disk)))

;; next-green : Color -> Color
;; Given Color, adds one point of green (if 255, next is 0)

(define (next-green c)
  (make-color
   (color-red c)
   (color-blue c)
   (if (< (color-green c) 255)
       (add1 (color-green c))
       0)))

;; change-color : Color Number Number MouseEvent -> Color
;; Given Color mouse xy and mouse-event, produces next color based on mouse xy
(check-expect
 (next-color (make-color 200 40 200) 270 210 "move")
 (make-color 255 40 210))
(check-expect
 (next-color (make-color 200 40 200) 210 -10 "button-down")
 (make-color 210 40 0))

(define (next-color c x y me)
  (cond
    [(mouse-event? me)
     (make-color
      (corrected x)
      (color-green c)
      (corrected y))]
    [else c]))


;; corrected : Number -> Number
;; Given a number, produces 0 if number < 0, 255 if number > 255, else original number
(check-expect (corrected 200) 200)
(check-expect (corrected 270) 255)
(check-expect (corrected -20) 0)

(define (corrected n)
  (cond
    [(> n 255) 255]
    [(< n 0) 0]
    [else n]))


;; render-disk : Color -> Image
;; Given a Color, produces an image of a disk with colors
(check-expect
 (render-disk (make-color 45 36 100))
 (circle 128 "solid" (make-color 45 36 100)))

(define (render-disk c)
  (circle (/ 256 2) "solid" c))
