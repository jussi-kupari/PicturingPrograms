;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex21810) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.10
; Develop a function range? on vehicles. It should take in the num-
; ber of hours you’re willing to travel, and will return how far you can go in that much time
; on this vehicle.

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

;; -- Functions

;; range? : Vehicle Number -> Number
;; Given a vehicle and number of hours, produces the distance traveled
(check-expect (range? (make-automobile 1200 200 150 30) 2) (* 200 2))
(check-expect (range? (make-train 120000 220 400) 2) (* 220 2))
(check-expect (range? (make-bicycle 12 70 28) 2) (* 70 2))

(define (range? ve t)
  (cond
    [(automobile? ve) (* (automobile-topspeed ve) t)]
    [(train? ve) (* (train-topspeed ve) t)]
    [else (* (bicycle-topspeed ve) t)]))