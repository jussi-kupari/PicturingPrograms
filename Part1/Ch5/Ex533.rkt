;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex533) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 5.3.3
; Write a contract and purpose statement for a
; function named pinwheel that takes in a picture and produces
; four copies of it in a square, differently rotated: the original
; picture in the top left, rotated 90◦ clockwise in the top
; right, rotated 180◦ in the bottom right, and rotated 90◦
; counterclockwise in the bottom left.

;; pinwheel: image -> image
;; Produces four copies of the original image in a square
;; starting with the original image on the top left and
;; rotating 90 deg cw for each successive image (clock-wise)