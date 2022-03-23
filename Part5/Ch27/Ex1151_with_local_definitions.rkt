;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex1151_with_local_definitions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Worked Exercise 11.5.1
Design a function road-trip-cost which determines the
cost of a road trip, given the number of miles you’re driving and how many days you’ll
be away. The car gets roughly 28 miles to the gallon, gasoline costs $2.459 per gallon,
and motels cost $40 per night. Furthermore, you don’t actually own a car, so you have
to rent one. The car rental agency charges a fixed processing fee of $10, plus $29.95
per day, plus $0.10 per mile . Assume that you’re bringing all your own food and drinks,
so you don’t need to worry about the cost of food on the road. Also assume that the
“number of days you’ll be away” includes both the day you leave and the day you return.|#

;; -- Constants

(define MILES-PER-GALLON #i28)
(define PRICE-PER-GALLON 2.459)
(define MOTEL-PRICE-PER-NIGHT 40)
(define CAR-RENTAL-FIXED-FEE 10)
(define CAR-RENTAL-PER-DAY 29.95)
(define CAR-RENTAL-PER-MILE 0.10)

;; -- Functions

;; Number (distance in miles) Natural (days) -> Number
;; Given gas, motel and car rental expences, produces the total cost of the trip
(check-within (road-trip-cost 0 1) 39.95 .01) ;gas and motels cost 0
(check-within (road-trip-cost 0 2) 109.90 .01) ;gas 0, motel $40
(check-within (road-trip-cost 28 1) 45.209 .01) ;$42.75 car, $0 motel, $2.459 gas
(check-within (road-trip-cost 77 2) 124.36 .01) ;$77.60 car, c. $6.76 gas, $40 motel
(check-within (road-trip-cost 358 3) 247.09 .01) ;$135.65 car, c. $31.44 gas, $80 motel

(define (road-trip-cost miles days)
  (local [(define MPG 28)
          (define PRICE-PER-GALLON 2.459)
          (define MOTEL-PRICE-PER-NIGHT 40)
          (define CAR-RENTAL-FIXED-FEE 10)
          (define CAR-RENTAL-PER-DAY 29.95)
          (define CAR-RENTAL-PER-MILE 0.10)
          (define gas-needed (/ miles MPG)) 
          (define gas-cost (* PRICE-PER-GALLON gas-needed))
          (define motel-cost (* MOTEL-PRICE-PER-NIGHT (- days 1)))
          (define rental-cost
            (+ CAR-RENTAL-FIXED-FEE
               (* days CAR-RENTAL-PER-DAY)
               (* miles CAR-RENTAL-PER-MILE)))]
    (+ gas-cost motel-cost rental-cost)))