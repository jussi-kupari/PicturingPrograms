;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7722_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.22
; Develop a function named progress-bar that takes in three numbers
; (width, height, and progress) and a string ( color) and produces a horizontal progress
; bar as in this example, in which the leftmost progress pixels are solid and the rest are
; outlined. You may assume that width, height, and progress are all positive integers, and
; that progress is no larger than width.
; 
; .

(require picturing-programs)

;; progress-bar

;; Number (width)
;; Number (height)
;; Number (progress)
;; String (color) -> Image
;; Given width, height, progress and color produce a progress-bar
(check-expect
 (progress-bar 50 20 10 "blue")
 (overlay/xy (rectangle 10 20 "solid" "blue") 0 0 (rectangle 50 20 "outline" "blue")))

(define (progress-bar w h p c)
  (overlay/xy (rectangle p h "solid" c) 0 0 (rectangle w h "outline" c)))







