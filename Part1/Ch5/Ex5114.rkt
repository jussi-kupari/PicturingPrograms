;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5114) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; Exercise 5.11.4
; Add a body to the bullseye function of Exercise 5.9.5.

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

#;
(define (bullseye r1 r2 col1 col2)
  ; r1      number
  ; r2      number
  ; col1    string
  ; col2    string
  ; "solid" string
  ...)

(define (bullseye r1 r2 col1 col2)
  (overlay
   (circle r2 "solid" col2)
   (circle r1 "solid" col1)))