;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1717) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 17.1.7
; Develop an animation that shows a red triangle for two seconds,
; then a green triangle for two seconds, then a blue triangle for two seconds, and
; then stops.
; 
; First version gets stuck on "blue", because after "blue" comes "blue";
; however, the program never ends

(require picturing-programs)

;; -- Data Definition

;; Color is a string and one of:
;; - "red"
;; - "green"
;; - "blue"

;; -- Functions

;; main : Color -> Color
(define (main c)
  (big-bang c
    (check-with string?)
    (on-tick next-color 2)
    (to-draw render-color)))


;; next-color : Color -> Color
;; Given Color, produces next Color
(check-expect (next-color "red") "green")
(check-expect (next-color "green") "blue")
(check-expect (next-color "blue") (stop-with "blue"))

(define (next-color c)
  (cond
    [(string=? c "red") "green"]
    [(string=? c "green") "blue"]
    [(string=? c "blue")(stop-with "blue")]))


;; render-color : Color -> Image
;; Given Color, produces an image of a triangle in that color
(check-expect (render-color "red") (triangle 30 "solid" "red"))

(define (render-color c)
  (triangle 30 "solid" c))

