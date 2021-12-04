;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex643) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 6.4.3
; Develop an animation which moves a picture of your choice to the
; left by 3 pixels every half second, starting at the top-left corner
; (so the picture seems to fall off the left edge of the window).


(require picturing-programs)


;; Image of a book moving left off the screen 3 pix per 1/2 second

;; -- Constants

; Width
(define WIDTH 100)

; Height
(define HEIGHT 500)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Book
(define BOOK pic:book)

; y-position
(define Y 30)



;; -- Data Definition

;; Booky is a Number
;; interp. the x-position of the book

(define B1 0)
(define B2 -10)

#;
(define (fn-for-booky b)
  (... b))

;; Template rules used:
;;  - atomic non-distinct: Number



;; -- Functions


;; Booky -> Booky
;; Makes book walk down the scene (main 0)


(define (main b)
  (big-bang b                   ; Booky -> Booky
      (on-tick next-book 1/2)  ; Booky -> Booky
    (to-draw render-book)))    ; Booky -> Image



;; Booky -> Booky
;; Given booky, produce next booky

(check-expect (next-book 10) 7)
(check-expect (next-book 0) -3)

#;
(define (next-book b)  ; stub
  0)

;<template from Booky>

(define (next-book b)
  (- b 3))


;; Booky -> Image
;; Given Booky, produce image of book

(check-expect (render-book 50)
              (place-image BOOK 50 Y SCENE))


;(define (render-book b) pic:book) ; stub

;<template from Booky>

(define (render-book b)
  (place-image BOOK b Y SCENE))


