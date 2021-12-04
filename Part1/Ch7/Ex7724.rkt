;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7724) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.24
; Develop a function frame-pic that takes in an image, a color name,
; and a positive number, and produces that picture surrounded by a “frame” of the specified
; color and thickness. For example,
; 
; .

(require picturing-programs)

;; Image String Number -> Image


(define (frame-pic img col size)
  (overlay img
           (overlay (rectangle (image-width img)
                               (image-height img) "solid" "white")
                    (rectangle (+ (image-width img) (* size 2))
                               (+ (image-height img) (* size 2))
                               "solid" col))))
