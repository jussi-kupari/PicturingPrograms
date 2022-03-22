;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5141_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 5.14.1
; Develop a function named diamond that takes in a string (the color
; of the diamond) and a number (the length of one of its sides) and produces a diamond
; shape, i.e. two triangles connected along one side.
; 
; .
; 

(require picturing-programs)

; diamond: string (color of diamond)
;          number (length of diamond side) -> image

; Given color and length of side
; produce a diamond standing on its sharp edge

(check-expect (diamond "green" 20)
              (above (triangle 20 "solid" "green")
                     (flip-vertical (triangle 20 "solid" "green"))))

(check-expect (diamond "blue" 30)
              (above (triangle 30 "solid" "blue")
                     (flip-vertical (triangle 30 "solid" "blue"))))

#;                            
(define (diamond col side)  ; skeleton
  ; col  string
  ; side number
  ; "solid" 
  ...)

(define (diamond col side)
  (above (triangle side "solid" col)
                     (flip-vertical (triangle side "solid" col))))

