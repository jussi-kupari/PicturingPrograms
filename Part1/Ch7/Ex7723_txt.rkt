;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7723_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.23
; Develop a function bar-graph that takes in four numbers and pro-
; duces a bar-graph with four vertical bars (red, blue, green, and yellow respectively) of those
; heights.
; 
; .


(require picturing-programs)

;; Number Number Number Number -> Image
;; Given four heights, produce a bar-graph


(define (bar-graph n1 n2 n3 n4)
  (above(beside/align "bottom"
   (rectangle 40 n1 "solid" "red")
   (rectangle 40 n2 "solid" "blue")
   (rectangle 40 n3 "solid" "green")
   (rectangle 40 n4 "solid" "yellow"))
        (rectangle 200 1 "solid" "black")))
