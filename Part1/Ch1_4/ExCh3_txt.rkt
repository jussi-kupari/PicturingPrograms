;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ExCh3_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; Ex 3.3.4

(overlay
 (circle 10 "solid" "orange")
 (square 20 "solid" "blue"))

(overlay
 (ellipse 20 20 "solid" "orange")
 (square 20 "solid" "blue"))

; Ex 3.3.7

; A little backwards solution to the problem...
(define TRI
  (beside
   (right-triangle 20 40 "solid" "blue")
   (flip-horizontal (right-triangle 20 40 "solid" "blue"))))

(define SQRE (square 40 "solid" "orange"))

(overlay TRI SQRE)

; Another way

(define TRI2
  (rotate-180
   (beside
   (flip-horizontal (right-triangle 20 40 "solid" "orange"))
   (right-triangle 20 40 "solid" "orange"))))

(define SQRE2 (square 40 "solid" "blue"))

(overlay TRI2 SQRE2)

;  Ex 3.4.4
; Write the function contracts for ellipse, circle, triangle,
; and star-polygon, using the standard convention.
; 
; ellipse: number(width) number(height)
;          string("outline" or "solid")
;          string(color) -> image
; 
; circle: number(radius) string("outline" or "solid")
;         string(color) -> image
; 
; triangle: number(side) string("outline" or "solid")
;           string(color) -> image
; 
; star-polygon: number(side-lenght) number(side-count)
;               number(step-count) string("outline" or "solid")
;               string(color) -> image

; Ex 3.5.2

(crop-bottom . 25)

; Ex 3.5.2

(crop/align "left" "top" 20 20 .)

; SIDEBAR

(rotate-cw
 (crop-bottom (rotate-ccw .) 25))

; Ex 3.5.4

(crop-top (circle 30 "outline" "green") 15)

; Ex 3.5.5

(crop-bottom
 (crop-left (ellipse 50 30 "solid" "green") 25) 15)

; Ex 3.5.7

(crop-left . (/ (image-width .) 3))

; Ex 3.5.8

(define BLUE-RECT (rectangle 80 50 "solid" "blue"))
(define ORANGE-RECT (rectangle 30 20 "solid" "orange"))

(place-image ORANGE-RECT 55 15 BLUE-RECT)

; Ex 3.5.9

(define WANTED (text "Wanted!" 16 "red"))

(place-image WANTED
             (/ (image-width .) 2) (- (image-height .) 15) .)

; Ex 3.5.10

(overlay (text "word" 16 "blue")
         (overlay (rectangle 40 20 "outline" "purple")
                  (rectangle 40 20 "solid" "yellow")))

; Ex 3.8.3
; The below expression give the same value but are not the same expressions?
(rectangle 40 26 "solid" "dark blue")

(rotate-180 (scale 2 (rectangle 20 13 "solid" "dark blue")))
