;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5142) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 5.14.2
; Develop a function named text-box that takes in two strings, of
; which the second should be a color-name, and two numbers (width and height), and
; produces a picture of the first string, in 18-point black type, on a background
; rectangle of the specified color, width, and height.

(require picturing-programs)

; text-box: string (text)
;           string (color of background)
;           number (width in pixels)
;           number (height in pixels) -> image

; given text, color of background, width and height
; produce the text (size 18, black) in a abckground rectangle of the specified color and size

(check-expect (text-box "Wanted" "purple" 30 20)
              (overlay (text "Wanted" 18 "black")
           (rectangle 30 20 "outline" "purple")))

#;
(define (text-box message color width height) ; skeleton
  ; message   string
  ; color  string
  ; width  number
  ; height number
  ; "outline"
  ; 18
  ; "black
  ...)

(define (text-box message color width height)
  (overlay (text message 18 "black")
           (rectangle width height "outline" color)))

