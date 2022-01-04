;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2112) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.1.2
; How would you define the color type if it weren’t predefined?
; 
; (define-struct color (red green blue))
; ;; Color is (make-color Natural[0, 255] Natural[0, 255] Natural[0, 255])
; ;; interp. a color with RGB values  
; 
; (define red (make-color 255 0 0))
