;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 532to537_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; Exercise 5.3.2
; Write a contract and purpose statement for a function named
; copies-beside that takes in a number and an image, and produces
; that many copies of the image side by side.


; copies-beside: image number (number of copies) -> image
; Produces side-by-side copies of the image for the given number


; Exercise 5.3.3
; Write a contract and purpose statement for a
; function named pinwheel that takes in a picture and produces
; four copies of it in a square, differently rotated: the original
; picture in the top left, rotated 90◦ clockwise in the top
; right, rotated 180◦ in the bottom right, and rotated 90◦
; counterclockwise in the bottom left.


; pinwheel: image -> image
; Produces four copies of the original image in a square
; starting with the original image on the top left and
; rotating 90 deg cw for each successive image (clock-wise)


; Exercise 5.3.5
; Write a contract and purpose statement for the following problem:
; Design a program named bullseye which produces a “bull’s eye” style target with two
; rings. It takes in two numbers indicating the radii of the outer ring and the inner disk,
; and two strings representing the colors of the outer ring and the color of the inner disk.


; bullseye: number (outer circle radius)
;           number (inner circle radius)
;           string (outer ring color)
;           string (inner ring color) -> image
; Given radii of two circles and their colors
; produces an image of a "bull's eye" -style target



; Exercise 5.3.6
; Write a contract and purpose statement for the following problem:
; Design a program named dot-grid which expects two numbers (the width and height of
; the grid, respectively) and produces a rectangular grid of radius-5 circular blue dots.


; dot-grid: number (number of dots in column)
;           number (number of dots in row)
; Given the dimensions of column x row
; produces a grid of blue circular dots (5-pix rad)
; of those dimensions


; Exercise 5.3.7
; Write a contract and purpose statement for the following problem:
; Design a program named lollipop which produces a picture of a lollipop. It takes in
; two numbers — the radius of the lollipop “head” and the length of the “stick” — and a
; string, indicating the color of the lollipop. For the stick, use a rectangle of width 1.


; lollipop: number (radius on lollipop "head")
;           number (length of lollopop "stick")
;           string (color of lollipop)          -> image
; Given the radius of head, length of stick (pixels)
; and color, produce an image of a lollipop 


; Exercise 5.4.2
; Write several test cases for the copies-beside function described
; in Exercise 5.3.2.
; 
; ; copies-beside: image number (number of copies) -> image
; ; Produces side-by-side copies of the image for the given number
; 
; 
; (copies-beside (square 10 "solid" "red") 3)
; "Should be three red solid 10-pix side squares side-by-side"
; 
; (copies-beside (circle 10 "outline "green) 5)
; "Should be five green ouline circles with a radius of 10 side-by-side"
; 
; (copies-beside (circle 10 "outline "green) -1)
; "Should return an error because the number is negative"
; 
; (copies-beside (circle 10 "outline "green) 0.5)
; "Should return an error because the number is not natural"



; Exercise 5.4.3
; Write several test cases for the pinwheel function of Exercise 5.3.3.


; pinwheel: image -> image
; Produces four copies of the original image in a square
; starting with the original image on the top left and
; rotating 90 deg cw for each successive image (clock-wise)
( check-expect (pinwheel .)
               (beside
   (above . (rotate-ccw .))
   (above (rotate-cw .) (rotate-180 .))))


(define (pinwheel img)
  (beside
   (above img (rotate-ccw img))
   (above (rotate-cw img) (rotate-180 img))))



; Exercise 5.4.4
; Write several test cases for the checkerboard2 function of Exercise 5.3.4.
; 
; Hint: Technically, any two strings would satisfy the contract, but since the purpose
; statement adds "Assumes that both strings are color names", you don’t need to
; test it on strings that aren’t color names. Ideally, a program to be used by human beings
; should be able to handle a wide variety of incorrect inputs, and we’ll learn techniques for
; handling such situations in Chapter 19.



; checkerboard2 : string (top-left-color)
;                 string (top-right-color) -> image
; Assumes that both strings are color names.
; Produces a 2x2 checkerboard, with each small square 20
; pixels on a side, with the top-left color in the top-left
; and bottom-right positions, and the top-right color in
; the other two positions.

(check-expect (checkerboard2 "black" "red")
             (beside
   (above (square 20 "solid" "black")
          (square 20 "solid" "red"))
   (above (square 20 "solid" "red")
          (square 20 "solid" "black"))))



(define (checkerboard2 col1 col2)
  (beside
   (above (square 20 "solid" col1)
          (square 20 "solid" col2))
   (above (square 20 "solid" col2)
          (square 20 "solid" col1))))




; Exercise 5.4.5
; Write several test cases for the bullseye function of Exercise 5.3.5.



; bullseye: number (outer circle radius)
;           number (inner circle radius)
;           string (outer ring color)
;           string (inner ring color) -> image
; Given radii of two circles and their colors
; produces an image of a "bull's eye" -style target

(check-expect (bullseye 20 15 "black" "red")
              (overlay
   (circle 15 "solid" "red")
   (circle 20 "solid" "black")))


(define (bullseye r1 r2 col1 col2)
  (overlay
   (circle r2 "solid" col2)
   (circle r1 "solid" col1)))


; Exercise 5.4.6
; Write several test cases for the dot-grid function of Exercise 5.3.6.


; dot-grid: number (number of dots in column)
;           number (number of dots in row)
; Given the dimensions of column x row
; produces a grid of blue circular dots (5-pix rad)
; of those dimensions


; (dot-grid 5 3)
; "Should be 5x3 (column x row) blue solid dots with 5-radius each"


; Exercise 5.4.7
; Write several test cases for the lollipop function of Exercise 5.3.7.


; lollipop: number (radius on lollipop "head")
;           number (length of lollopop "stick")
;           string (color of lollipop)          -> image
; Given the radius of head, length of stick (pixels)
; and color, produce an image of a lollipop


; (lollipop 10 20 "red")
;"Should be a red lollipop with a head diameter of 10 and a stick length of 20"

; 
; Exercise 5.8.1 Write a function skeleton for the copies-beside function of Exer-
; cise 5.3.2.
; 
; ; copies-beside: image number (number of copies) -> image
; ; Produces side-by-side copies of the image for the given number
; 
; (define (beside-copies img n)
;   ...)
; 
; Exercise 5.8.2 Write a function skeleton for the pinwheel function of Exercise 5.3.3.
; 
; ; pinwheel: image -> image
; ; Produces four copies of the original image in a square
; ; starting with the original image on the top left and
; ; rotating 90 deg cw for each successive image (clock-wise)
; 
; (define (pinwheel img)
;   ...)
; 
; Exercise 5.8.3 Write a function skeleton for the checkerboard2 function of Exer-
; cise 5.3.4.
; 
; ; checkerboard2 : string (top-left-color)
; ;                 string (top-right-color) -> image
; ; Assumes that both strings are color names.
; ; Produces a 2x2 checkerboard, with each small square 20
; ; pixels on a side, with the top-left color in the top-left
; ; and bottom-right positions, and the top-right color in
; ; the other two positions.
; 
; (define (checkerboard2 col1 col2)
;   ...)
; 
; Exercise 5.8.4 Write a function skeleton for the bullseye function of Exercise 5.3.5.
; 
; ; bullseye: number (outer circle radius)
; ;           number (inner circle radius)
; ;           string (outer ring color)
; ;           string (inner ring color) -> image
; ; Given radii of two circles and their colors
; ; produces an image of a "bull's eye" -style target
; 
; (define (bullseye r1 r2 col1 col2)
;   ...)
; 
; Exercise 5.8.5 Write a function skeleton for the dot-grid function of Exercise 5.3.6.
; 
; ; dot-grid: number (number of dots in column)
; ;           number (number of dots in row)
; ; Given the dimensions of column x row
; ; produces a grid of blue circular dots (5-pix rad)
; ; of those dimensions
; 
; (define (dot-grid n n )
;   ...)
; 
; Exercise 5.8.6 Write a function skeleton for the lollipop function of Exercise 5.3.7.
; 
; ; lollipop: number (radius on lollipop "head")
; ;           number (length of lollopop "stick")
; ;           string (color of lollipop)          -> image
; ; Given the radius of head, length of stick (pixels)
; ; and color, produce an image of a lollipop
; 
; (define (lollipop r l col)
;   ...)
; 


