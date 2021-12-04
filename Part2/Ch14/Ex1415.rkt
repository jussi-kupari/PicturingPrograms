;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1415) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 14.1.5
; Modify the animation of Exercise 6.4.3 so that the animation ends
; when there’s nothing left to show in the window.
; 
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

;; -- Functions

;; Booky -> Booky
;; Makes book walk down the scene (main 0)


(define (main b)
  (big-bang b                  
    (on-tick next-book 1/2)  
    (to-draw render-book)
    (stop-when out-of-scene?)))


;; Booky -> Booky
;; Given booky, produce next booky

(check-expect (next-book 10) 7)
(check-expect (next-book 0) -3)

(define (next-book b)
  (- b 3))


;; Booky -> Image
;; Given Booky, produce image of book

(check-expect (render-book 50)
              (place-image BOOK 50 Y SCENE))

(define (render-book b)
  (place-image BOOK b Y SCENE))

;; Booky -> Boolean
;; Given booky, produce true when it is out of the scene
(check-expect (out-of-scene? 10) false)
(check-expect (out-of-scene? -10) false)
(check-expect (out-of-scene? -40) true)

(define (out-of-scene? b)
  (< b (- (/ (image-width BOOK) 2))))