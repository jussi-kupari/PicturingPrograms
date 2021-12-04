;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1713) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.1.3
; Modify the change-light function from Exercise 17.1.1 so that when the input is "red",
; it returns "purple". (It should now fail one of its test cases.)
; 
; Whathappens when you run the animation?
; After the first round on the purple light
; -> "cond: all question results were false"
; 
; Develop a function light-color? that takes in anything and tells whether it is
; one of the three values "red", "yellow", or "green".
; 
; Run the animation again with light-color? as the check-with handler. What
; happens this time?
; A better error appears
; -> "check-with: change-light returned "purple", which fails to pass check-with's
;     light-color? test" 
; 
; Hint: Be sure to test light-color? on all three legal light-colors, and on a string
; that isn’t a light-color (e.g. "beluga"), and on a non-string (e.g. 7). And remember
; the rule of thumb: functions that return a Boolean can usually be written more simply
; without a conditional than with one. But you may need to take advantage of short-circuit
; evaluation (remember section 13.8).

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
    (check-with light-color?)      ; check-with
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
        [(string=? c "red") "purple"]))


;; render-light: LightColor -> Image
;; Given LightColor, produces an image of it
(check-expect (render-light "green")(circle 30 "solid" "green"))
(check-expect (render-light "yellow")(circle 30 "solid" "yellow"))
(check-expect (render-light "red") (circle 30 "solid" "red"))

(define (render-light c)
  (circle 30 "solid" c))


;; light-color?: LighyColor -> Boolean
;; Given LightColor, produces true if LightColor is of "red", "yellow", or "green"

(check-expect (light-color? "green") true)
(check-expect (light-color? "yellow") true)
(check-expect (light-color? "red") true)
(check-expect (light-color? "purple") false)
(check-expect (light-color? 7) false)
(check-expect (light-color? true) false)

(define (light-color? c)
  (and
   (string? c)
   (or (string=? c "green")
       (string=? c "yellow")
       (string=? c "red"))))






