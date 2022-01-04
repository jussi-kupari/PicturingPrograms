;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2111) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.1.1
; What are the parts, fields, constructor, selectors, and discriminator
; of the color data type?
; 
; instance: any (make-posn x y) is an instance of posn (e.g. (make-posn 10 9))
; 
; fields/parts/instance variables: x and y
; 
; constructor: make-posn
; 
; selectors/getters: posn-x and posn-y
; 
; discriminator/predicate: posn?