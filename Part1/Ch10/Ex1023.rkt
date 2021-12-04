;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1023) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 10.2.3
; Write an animation that initially displays the word
; 
; "cat"
; 
; Each second, it inserts the letters "xyz" in the middle
; (i.e. between the first half and the second half) of the
; current word.
; 
; Hint: It may be useful to write a “helper” function insert-in-middle that takes two
; strings, and inserts one of them into the middle of the other.

(require picturing-programs)

;; animation of a growing string

;; -- Constants

;Scene
(define SCENE (empty-scene 500 500))


;; Main
;; initialize world with (main "cat")

(define (main s)
  (big-bang s
    (on-tick insert-in-middle 1)
    (to-draw render-image)))

;; String -> String
;; Given string, insert "xyz" in the middle
(check-expect (insert-in-middle "cat") "caxyzt")

(define (insert-in-middle s)
  (string-append
   (substring s 0 (round (/ (string-length s) 2)))
   "xyz"
   (substring s (round (/ (string-length s) 2)))))


;; String -> Image
;; Given a string, produces an image of it
(check-expect (render-image "cat")(overlay (text "cat" 18 "green") SCENE))

(define (render-image s)
  (overlay (text s 18 "green") SCENE))