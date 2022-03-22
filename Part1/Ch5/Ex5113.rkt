;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5113) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; Exercise 5.11.3
; Add a body to the checkerboard2 function of Exercise 5.9.4.

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

#;
(define (checkerboard2 col1 col2)
  ; col1 string
  ; col2 string
  ; 20 number
  ...)

(define (checkerboard2 col1 col2)
  (beside
   (above (square 20 "solid" col1)
          (square 20 "solid" col2))
   (above (square 20 "solid" col2)
          (square 20 "solid" col1))))