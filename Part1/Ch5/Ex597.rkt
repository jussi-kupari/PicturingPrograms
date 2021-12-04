;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex597) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; Exercise 5.9.7
; Add an inventory to the lollipop function of Exercise 5.8.6.


; lollipop: number (radius on lollipop "head")
;           number (length of lollopop "stick")
;           string (color of lollipop)          -> image
; Given the radius of head, length of stick (pixels)
; and color, produce an image of a lollipop

(define (lollipop r l col)
  ; r   number
  ; l   number
  ; col string
  ...)