;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5145_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 5.14.5
; Develop a function named caption-below that takes in an image
; and a string, and produces a copy of the same image with a caption underneath it:
; 
; .


(require picturing-programs)

; caption-below: image
;                string (caption) -> image
; Given an image and a text
; produce an image with the text as caption below it

(check-expect (caption-below pic:bloch "Dr. Bloch")
              (above pic:bloch (text "Dr. Bloch" 20 "black")))

#;
(define (caption-below pic cap) ; skeleton
  ; pic image
  ; cap string
  ; "black"
  ; 20
  ...)


(define (caption-below pic cap)
  (above pic (text cap 20 "black")))











