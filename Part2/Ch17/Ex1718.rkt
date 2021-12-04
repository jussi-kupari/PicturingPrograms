;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1718) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 17.1.7
; Develop an animation that shows a red triangle for two seconds,
; then a green triangle for two seconds, then a blue triangle for two seconds, and
; then stops.
; 
; Exercise 17.1.8 Modify the animation of Exercise 17.1.7 to stop immediately after
; turning blue.
; 
; Hint: I know of two ways to do this: one is similar to the above but calls stop-with in
; different circumstances, and the other uses a stop-when handler instead of the stop-with
; call in next-color. Try both.
; 
; I DONT GET IT (stop-when never shows the last triangle)

(require picturing-programs)

;; -- Data Definition

;; Color is a string and one of: "red", "green", "blue"

;; -- Functions

;; main : Color -> Color
(define (main c)
  (big-bang c
    (check-with string?)
    (on-tick next-color 2)
    (stop-when over?)
    (to-draw render-color)))


;; next-color : Color -> Color
;; Given Color, produces next Color
(check-expect (next-color "red") "green")
(check-expect (next-color "green") "blue")

(define (next-color c)
  (cond
    [(string=? c "red") "green"]
    [(string=? c "green") "blue"]))


;; over? : Color -> Boolean
;; Given Color, produces true if "blue"

(define (over? c)
  (string=? c "blue"))

;; render-color : Color -> Image
;; Given Color, produces an image of a triangle in that color
(check-expect (render-color "red") (triangle 30 "solid" "red"))

(define (render-color c)
  (triangle 30 "solid" c))

