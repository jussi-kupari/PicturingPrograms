;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1412) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 14.1.2
; Recall the animation of Exercise 10.2.1, which initially displayed an
; “a”, then “ab” a second later, then “abb”, and so on. Modify this
; animation so it stops when the string reaches ten letters long
; ( i.e. “abbbbbbbbb”).

(require picturing-programs)

;; an animation of a growing string until 10 characters long

;; -- Constants

;Scene
(define SCENE (empty-scene 200 200))

;; -- Functions

;; Main
;; intialize world with (main "a")
(define (main s)
  (big-bang s
    (on-tick grow-string 2)
    (to-draw render-image)
    (stop-when length-10?)))

;; String -> String
;; Given a string, adds "b" at the end
(check-expect (grow-string "a") "ab")
(check-expect (grow-string "ab") "abb")

(define (grow-string s)
  (string-append s "b"))

;; String -> Boolean
;; Given string, produce true if string length is 10
(check-expect (length-10? "0123456789") true)
(check-expect (length-10? "01234567") false)
(check-expect (length-10? "012345678910") false)

(define (length-10? s)
  (= (string-length s) 10))


;; String -> Image
;; Given a string, produces an image of it
(check-expect (render-image "abc")(overlay (text "abc" 18 "green") SCENE))

(define (render-image s)
  (overlay (text s 18 "green") SCENE))