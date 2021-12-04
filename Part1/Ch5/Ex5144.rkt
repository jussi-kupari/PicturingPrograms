;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5144) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 5.14.4
; (Thanks to Leon LaSpina for this problem)
; 
; Develop a function named circle-in-square that takes in a number (the length
; of a side of a square) and two strings (the colors of a square and a circle), and produces
; a picture of a square of one color, with a circle of the other color inscribed inside it. The
; diameter of the circle should be the same as the side of the square, so the circle just barely
; touches the edge of the square at the middle of each side.
; 
; Hint: If you’ve already read Chapter 7, you’ll be tempted to do this using arithmetic.
; But it can be done without arithmetic, using only what you’ve seen so far.


(require picturing-programs)

; circle-in-square: number (length of side)
;                   string (color of square)
;                   string (color of circle) -> image

; Given the length of square side and the colors of square and circle
; produce and image of a square with a circle inside it

(check-expect (circle-in-square 30 "red" "green")
              (overlay
               (ellipse 30 30 "outline" "green")
               (square 30 "outline" "red")))

#;
(define (circle-in-square l col1 col2) ; skeleton
  ; l number
  ; col1 string
  ; col2 string
  ; "outline"
  ...)

(define (circle-in-square l col1 col2)
  (overlay
   (ellipse l l "outline" col2)
   (square l "outline" col1)))







