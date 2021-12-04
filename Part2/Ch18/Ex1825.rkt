;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1825) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 18.2.5
; Develop an animation that allows the user to “type” into the animation window:
; every time the user types an ordinary character, that character is added
; to the right-hand end of the animation window. The program will ignore arrow keys,
; function keys, etc.
; 
; Hint: See Exercise 10.2.1 for some ideas, and use string-length to check whether
; the key is an ordinary character (i.e. the key-event is a one-character string).
; Be sure to test your program with arrow keys as well as ordinary characters.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 250 20))


;; -- Data Definition

;; String is a String

;; -- Functions

;; main : String -> String
(define (main s)
  (big-bang s
    (on-key next-string)
    (to-draw render-string)))

;; next-string : String KeyEvent -> String
;; Given String and a key, produces the next string 
(check-expect (next-string "" "a") "a")
(check-expect (next-string " " "a") " a")
(check-expect (next-string "" "down") "")

(define (next-string s ke)
  (cond
    [(and (= (string-length ke) 1)(key-event? ke)) (string-append s ke)]
    [else s]))


;; render-string : String -> Image
;; Given string, produces an image


(define (render-string s)
  (place-image (text s 16 "black") (/ (image-width SCENE) 2) 10 SCENE))