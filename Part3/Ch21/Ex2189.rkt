;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2189) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.9
; Define a data type vehicle which is either a car, a bicycle, or a train.
; All three types of vehicle have a weight and a top speed. A bicycle has a number of gears,
; a train has a length and a car has a horsepower (e.g. 300) and a fuel-economy rating
; (e.g. 28 miles/gallon).


;; -- Data Definitions

;; Vehicle is one of:
;; - automobile
;; - bicycle
;; - train

(define-struct automobile (weight topspeed hp mpg))
;; Automobile is (make-automobile (Number Number Number Number))
;; interp. a car with weight top-speed, horsepower and fuel-economy

(define-struct bicycle (weight topspeed gears))
;; Bicycle is (make-bicycle (Number Number Natural))
;; interp. a bicycle with weight top-speed and number of gears

(define-struct train (weight topspeed length))
;; Train is (make-train (Number Number Number))
;; interp. a train with weight top-speed and length

