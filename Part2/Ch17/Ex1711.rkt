;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1711) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 17.1.1
; Develop an animation of a simple traffic light. It should initially show a green disk.
; After 5 seconds, it should change to yellow and after another 5 seconds, to red.
; Then after another 5 seconds, back to green, and so on.

(require picturing-programs)

;; -- Data Definition

;; A LightColor is any of the strings "green", "yellow", or "red".


; "inventory" template:

#|
(check-expect (function-on-light-color "green") ...)
(check-expect (function-on-light-color "yellow") ...)
(check-expect (function-on-light-color "red") ...)

(define (function-on-light-color c)
(cond [(string=? c "green") ...]
[(string=? c "yellow") ...]
[(string=? c "red") ...]))
|#


; “outventory” template:

#|
(check-expect (function-returning-light-color ...) "green")
(check-expect (function-returning-light-color ...) "yellow")
(check-expect (function-returning-light-color ...) "red")

(define (function-returning-light-color c)
(cond [... "green"]
[... "yellow"]
[... "red"]))
|#


;; -- Functions


;; main: LightColor -> LightColor
(define (main c)
  (big-bang c
    (check-with string?)      ; check-with
    (on-tick change-light 5)
    (to-draw render-light)))


;; change-light: LightColor -> LightColor
;; Given LightColor, produces the next LightColor

(check-expect (change-light "green") "yellow")
(check-expect (change-light "yellow") "red")
(check-expect (change-light "red") "green")

(define (change-light c)
(cond [(string=? c "green") "yellow"]
[(string=? c "yellow") "red"]
[(string=? c "red") "green"]))


;; render-light: LightColor -> Image
;; Given LightColor, produces an image of it
(check-expect (render-light "green")(circle 30 "solid" "green"))
(check-expect (render-light "yellow")(circle 30 "solid" "yellow"))
(check-expect (render-light "red") (circle 30 "solid" "red"))

(define (render-light c)
  (circle 30 "solid" c))









