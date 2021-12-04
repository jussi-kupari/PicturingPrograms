;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1021) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 10.2.1
; Write an animation that initially displays the letter “a”
; in 18-point green type, and each second adds a “b” onto the end.
; So after one second it’ll say “ab”, after two seconds “abb”, etc.
; 
; Hint:
; For this animation, your “model” should be a string, and your
; draw handler will involve the text function.

(require picturing-programs)

;; an animation of a growing string

;; -- Constants

;Scene
(define SCENE (empty-scene 200 200))

;; -- Functions

;; Main
;; intialize world with (main "a")
(define (main s)
  (big-bang s
    (on-tick grow-string 2)
    (to-draw render-image)))

;; String -> String
;; Given a string, adds "b" at the end
(check-expect (grow-string "a") "ab")
(check-expect (grow-string "ab") "abb")

(define (grow-string s)
  (string-append s "b"))


;; String -> Image
;; Given a string, produces an image of it
(check-expect (render-image "abc")(overlay (text "abc" 18 "green") SCENE))

(define (render-image s)
  (overlay (text s 18 "green") SCENE))


; Exercise 10.2.2
; Add a mouse handler to the previous animation: every time the
; mouse is moved or clicked, one character will be chopped off
; the beginning of the string.


;; Main.v2
;; initialize world with (main.v2 "a")
(define (main.v2 s)
  (big-bang s
    (on-tick grow-string 1)
    (on-mouse chop-string)
    (to-draw render-image)))


;; String Number Number MouseEv -> String
(check-expect (chop-string "abc" 0 0 "move")        "bc")
(check-expect (chop-string "abc" 0 0 "button-down") "bc")
(check-expect (chop-string "abc" 0 0 "drag")       "abc")
(check-expect (chop-string    "" 0 0 "move")         "a")

(define (chop-string s x y me)
  (cond
    [(or (mouse=? "move" me) (mouse=? "button-down" me))
     (if (zero? (string-length s)) "a" (substring s 1))]
    [else s]))




















