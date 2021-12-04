;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7721) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.21 (Thanks to Leon LaSpina for this problem)
; Develop a function named splice-pictures that takes in two images and combines
; them by splicing the left half of the first together with the right half of the second.


(require picturing-programs)

;; splice-pictures: Image Image -> Image
;; Given two images
;; produce an combination of the left half of pic one with right half of pic two


(define (splice-pictures img1 img2)
  (beside
   (rotate-ccw(crop-bottom (rotate-cw img1) (round (/ (image-width img1) 2))))
   (rotate-cw(crop-bottom (rotate-ccw img2) (round (/ (image-width img2) 2))))))

