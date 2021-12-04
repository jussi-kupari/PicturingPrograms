;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1151_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 
; Worked Exercise 11.5.1
; Design a function road-trip-cost which determines the
; cost of a road trip, given the number of miles you’re driving and how many days you’ll
; be away. The car gets roughly 28 miles to the gallon, gasoline costs $2.459 per gallon,
; and motels cost $40 per night. Furthermore, you don’t actually own a car, so you have
; to rent one. The car rental agency charges a fixed processing fee of $10, plus $29.95
; per day, plus $0.10 per mile . Assume that you’re bringing all your own food and drinks,
; so you don’t need to worry about the cost of food on the road. Also assume that the
; “number of days you’ll be away” includes both the day you leave and the day you return.
; 
; Solution:
; This is a more complicated problem than we’ve yet seen. If you try to solve
; the whole thing at once, you’ll be overwhelmed. Even if you manage to write a single
; function that solves the whole problem, it’ll be long, complicated, and confusing. We
; need to take a more careful, methodical approach.



; The examples will be a pain, since they require that we solve the whole problem at
; once, at least in specific cases.
; 
; So before we jump into that, let’s think about how to
; break the problem into smaller pieces.
; 
; What are the important values and quantities in the problem?
; 
; • the total cost of the road trip
; • the number of miles we’re driving
; • the number of days we’ll be away
; • the fuel efficiency of the car
; • the price of gasoline
; • the amount of gasoline we need
; • the amount we spend on gasoline
; • the cost per night of a motel
; • the number of nights we need to stay in a motel
; • the amount we spend on motels
; • the fixed processing fee for car rental
; • the daily charge for car rental
; • the per-mile charge for car rental
; • the amount we spend on car rental
; 
; These quantities fall into several categories: some are fixed numbers
; (for which we probably want to use variables — see Section 11.2) — some
; are inputs (i.e. parameters) to the function, some are output from the
; function, and some are intermediate results that we need along the way.
; 
; Fixed numbers:
; • the fuel efficiency of the car
; • the price of gasoline
; • the cost per night of a motel
; • the fixed processing fee for car rental
; • the daily charge for car rental
; • the per-mile charge for car rental
; 
; Inputs to the road-trip-cost function:
; • the number of miles we’re driving
; • the number of days we’ll be away
; 
; Output from the road-trip-cost function: the total cost of the road trip
; 
; Intermediate results
; • the amount of gasoline we need
; • the amount we spend on gasoline
; • the number of nights we need to stay in a motel
; • the amount we spend on motels
; • the amount we spend on car rental


;; -- Constants

(define MILES-PER-GALLON #i28)
(define PRICE-PER-GALLON 2.459)
(define MOTEL-PRICE-PER-NIGHT 40)
(define CAR-RENTAL-FIXED-FEE 10)
(define CAR-RENTAL-PER-DAY 29.95)
(define CAR-RENTAL-PER-MILE 0.10)

; .


;; -- Main function

;; Number (distance in miles) Natural (days) -> Number
;; Given gas, motel and car rental expences, produces the total cost of the trip
(check-within (road-trip-cost 0 1) 39.95 .01) ;gas and motels cost 0
(check-within (road-trip-cost 0 2) 109.90 .01) ;gas 0, motel $40
(check-within (road-trip-cost 28 1) 45.209 .01) ;$42.75 car, $0 motel, $2.459 gas
(check-within (road-trip-cost 77 2) 124.36 .01) ;$77.60 car, c. $6.76 gas, $40 motel
(check-within (road-trip-cost 358 3) 247.09 .01) ;$135.65 car, c. $31.44 gas, $80 motel

(define (road-trip-cost d n)
  (+ (gas-cost d)
     (rental-cost d n)
     (motel-cost n)))


;; -- Helpers

;; Number -> Number
;; Given the distance in miles, produces the gas consumption
(check-within (gas-needed 0) 0 .1)
(check-within (gas-needed 28) 1 .1)
(check-within (gas-needed 56) 2 .1)
(check-within (gas-needed 77) 2.75 .1)
(check-within (gas-needed 358) 12.8 .1)

(define (gas-needed n)
  (/ n MILES-PER-GALLON))

;; Number -> Number
;; Given the gallon of gas, produces the cost 
(check-within (cost-of-gallons 0) 0 .01)
(check-within (cost-of-gallons 1) 2.459 .01)
(check-within (cost-of-gallons 2) 4.918 .01)
(check-within (cost-of-gallons 2.75) 6.76225 .01)

(define (cost-of-gallons n)
  (* PRICE-PER-GALLON n))

;; Number -> Number
;; Given the number of miles driven, produces the cost of gas
(check-within (gas-cost 0) 0 .01)
(check-within (gas-cost 28) 2.459 .01) ; i.e. one gallon
(check-within (gas-cost 56) 4.918 .01) ; i.e. two gallons
(check-within (gas-cost 77) 6.76 .01) ; 2-3/4 gal; use calculator
(check-within (gas-cost 358) 31.44 .01) ; yecch; use calculator

(define (gas-cost n)
  (cost-of-gallons (gas-needed n)))


;; Natural (days) -> Number
;; Given the number of days, produces the total expenses from motel stays
;; !!!
(check-expect (motel-cost 1) 0)
(check-expect (motel-cost 2) MOTEL-PRICE-PER-NIGHT)
(check-expect (motel-cost 7) (* MOTEL-PRICE-PER-NIGHT 6))
(check-expect (motel-cost 16) (* MOTEL-PRICE-PER-NIGHT (sub1 16)))

(define (motel-cost n)
  (* (nights-in-motel n) MOTEL-PRICE-PER-NIGHT))

;; Natural (days) -> Natural
;; Given the number of days, produces the number of nights spent in motels
(check-expect (nights-in-motel 1) 0)
(check-expect (nights-in-motel 2) 1)
(check-expect (nights-in-motel 10) 9)

(define (nights-in-motel n)
  (sub1 n))

;; Number (distance) Natural (days) -> Number
;; Given the distance and days spent, produces the car rental expenses
;; !!!
(check-within (rental-cost 0 1) 39.95 .01)
(check-within (rental-cost 0 2) 69.90 .01)
(check-within (rental-cost 100 1) 49.95 .01)
(check-within (rental-cost 100 2) 79.90 .01)
(check-within (rental-cost 28 1) 42.75 .01)
(check-within (rental-cost 77 2) 77.60 .01)
(check-within (rental-cost 358 3) 135.65 .01)

(define (rental-cost d n)
  (+ CAR-RENTAL-FIXED-FEE
     (* CAR-RENTAL-PER-DAY n)
     (* CAR-RENTAL-PER-MILE d)))

