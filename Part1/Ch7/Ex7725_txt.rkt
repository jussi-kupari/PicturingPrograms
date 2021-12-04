;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7725_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.25
; My wife wanted to change the background image on her Web page to a
; repeating image. But she didn’t want the image to repeat in a monotonous checkerboard
; pattern; she wanted each row to be offset from the previous one. Unfortunately, there’s no
; HTML command to do that, so I had to build an image which, when repeated horizontally
; and vertically, looks like alternating rows offset from one another.
; 
; Develop a function offset-tile which takes in an image and produces an image
; twice as tall: the top row is the original image, and the bottom row is the image split in
; half and put back together in reverse order.
; 
; .
; 
; Hint: This is trickier than it seems at first. Be sure to test it on both even-width and
; odd-width images, and try putting several copies of the result side by side to make sure
; you haven’t created “jaggies”.
; 
; .
; 
; This exercise may be easier if you first define two “helper functions” left-half and
; right-half. We’ll learn more about helper functions in Chapter 11.


(require picturing-programs)

;; offset-tile: Image -> Image
;; Given image, produce an image twice as tall
;; the top row is the original image, and the bottom row is the image split in
;; half and put back together in reverse order.

;; Too lazy to write checks, checking manually

(define (offset-tile img)
  (above img
         (beside
          (rotate-cw (crop-bottom (rotate-ccw img) (round (/ (image-width img) 2))))
          (rotate-ccw (crop-bottom (rotate-cw img) (round (/ (image-width img) 2)))))))

