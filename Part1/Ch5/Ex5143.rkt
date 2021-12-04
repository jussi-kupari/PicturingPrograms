;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5143) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 5.14.3
; (Thanks to Leon LaSpina for this problem)
; Develop a function named two-eyes that, given a number and a color name, pro-
; duces a picture of two circular “eyes”, 100 pixels apart horizontally. Each one should
; have a black “pupil” of radius 10, surrounded by an “iris” of the specified color and ra-
; dius (which you may assume is more than 10). The 100-pixel separation is measured from
; edge to edge, not center to center.


(require picturing-programs)

; two-eyes: number (radius)
;           string (color) -> image

; Given the radius of "eye" and color if "iris"
; produce two eyes (10-radius pupil) 100 pixels apart from inner egdes

(check-expect (two-eyes 20 "green")
              (overlay/xy
               (overlay (circle 10 "solid" "black") (circle 20 "solid" "green"))
               (+ 100 (* 20 2)) 0 (overlay (circle 10 "solid" "black") (circle 20 "solid" "green"))))

#;
(define (two-eyes r col) ; skeleton
  ; r   number
  ; col string
  ; 10
  ; "black"
  ...)


(define (two-eyes r col) 
  (overlay/xy
   (overlay (circle 10 "solid" "black") (circle r "solid" col))
   (+ 100 (* r 2)) 0 (overlay (circle 10 "solid" "black") (circle r "solid" col))))


