;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex642) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Exercise 6.4.2
; Develop an animation which moves a picture of your choice down 5
; pixels every half second, starting at the top-left corner of the window.


(require picturing-programs)

;; Image of a book moving down the screen 5 pix per 1/2 second

;; -- Constants

; Width
(define WIDTH 100)

; Height
(define HEIGHT 500)

; Scene
(define SCENE (empty-scene WIDTH HEIGHT))

; Book
(define BOOK pic:book)

; x-position
(define X 30)



;; -- Data Definition

;; Booky is a Number
;; interp. the y-position of the book

(define B1 0)
(define B2 100)

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

(check-expect (next-book 10) 15)
(check-expect (next-book 300) 305)

#;
(define (next-book b)  ; stub
  0)

;<template from Booky>

(define (next-book b)
  (+ b 5))


;; Booky -> Image
;; Given Booky, produce image of book

(check-expect (render-book 50)
              (place-image BOOK X 50 SCENE))


;(define (render-book b) pic:book) ; stub

;<template from Booky>

(define (render-book b)
  (place-image BOOK X b SCENE))







