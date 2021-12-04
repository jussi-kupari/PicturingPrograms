;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1121) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 11.2.1
; Design a function named gas-cost that estimates how
; much you’ll spend on gasoline for a trip. It should
; take in the number of miles you’re driving, and return
; how much you expect to spend, in dollars. Your car
; gets approximately 28 miles per gallon ( i.e. this
; is an inexact number), and gasoline costs $2.459 per
; gallon. (This example was written in 2006, when that
; was a reasonable price for gasoline!)
; 



;; Number -> Number
;; Given number of miles, produces expected amount spent on gas in USD
(check-within (gas-cost 0) 0 .01)
(check-within (gas-cost 28) 2.459 .01) ; i.e. one gallon
(check-within (gas-cost 56) 4.918 .01) ; i.e. two gallons
(check-within (gas-cost 77) 6.76 .01) ; 2-3/4 gal; use calculator
(check-within (gas-cost 358) 31.44 .01) ; yecch; use calculator

(define (gas-cost n)
  (* (/ n 28) 2.459))

; Exercise 11.2.2
; Replace 28 everywhere it appears in
; the program with a variable named MILES-PER-GALLON,
; define that variable appropriately, and make sure
; the program still works. Change the values of the
; variable and the “right answers”, and test that the
; program produces the new correct answers.


;; Constants
(define MILES-PER-GALLON 28)
(define PRICE-PER-GALLON 2.459)

;; Number -> Number
;; Given number of miles, produces expected amount spent on gas in USD
(check-within (gas-cost 0) 0 .01)
(check-within (gas-cost 28) 2.459 .01) ; i.e. one gallon
(check-within (gas-cost 56) 4.918 .01) ; i.e. two gallons
(check-within (gas-cost 77) 6.76 .01) ; 2-3/4 gal; use calculator
(check-within (gas-cost 358) 31.44 .01) ; yecch; use calculator

(define (gas-cost.v2 n)
  (* (/ n MILES-PER-GALLON)  2.459))

; Exercise 11.3.1
; Write, test, and debug the gas-needed, cost-of-gallons,
; and (new, improved) gas-cost functions.



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
(check-within (gas-cost.v3 0) 0 .01)
(check-within (gas-cost.v3 28) 2.459 .01) ; i.e. one gallon
(check-within (gas-cost.v3 56) 4.918 .01) ; i.e. two gallons
(check-within (gas-cost.v3 77) 6.76 .01) ; 2-3/4 gal; use calculator
(check-within (gas-cost.v3 358) 31.44 .01) ; yecch; use calculator

(define (gas-cost.v3 n)
  (cost-of-gallons (gas-needed n)))





