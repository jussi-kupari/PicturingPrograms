;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1162_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.6.2
; A small commercial airline company wants to figure out how much to
; charge for its tickets. Specifically, for any given ticket price,
; they’d like to be able to predict how much profit they’ll make.
; Given that ability, they can try various different ticket prices,
; see which produces the most profit, and select that as their ticket
; price. Profit, of course, is income minus expenses. There are two
; major expenses: paying the salaries of the pilot, copilot, and two
; flight attendants (these four salaries add up to $450 per flight,
; regardless of how many passengers are on the flight), and jet fuel,
; at $2.999/gallon. The amount of jet fuel consumed is one gallon per
; twenty pounds of loaded weight, which is the weight of the airplane
; itself plus the weight of the people and luggage on it. The airplane
; itself weighs 50000 pounds. Each passenger and his/her luggage, on
; average, weighs 250 pounds, same for the four crew members
; (pilot, copilot, two flight attendants). The airline is currently
; charging $200/ticket, and at that price they can typically sell
; 120 tickets. Raising the price means they make more money on each
; ticket, but it also causes fewer people to buy tickets. Conversely,
; lowering the price means they take in less money on each ticket, but
; they can sell more of them. To be precise, they estimate that for each
; $10 they raise (lower) the ticket price, they’ll lose (gain) 4 paying
; passengers.
; 
; Develop a function airline-profit that takes in a proposed
; ticket price, and returns the estimated profit the airline will make
; at that price. Use your function to determine the profit-maximizing
; ticket price. Also find the least they could charge and make any
; profit at all. Change one or two of the constants (e.g. the price
; of jet fuel, the number of people who change their minds about buying
; tickets when the price goes up or down, the size of the crew, the
; crew salaries, etc.) and repeat the previous paragraph.
; 
; Asnwer: profit is maximal at 270 USD ticket price


;  Dependency-chart
; .


;; -- Constants

(define SALARIES 450)
(define FUEL-PRICE-PER-GALLON 2.999)
(define PLANE-WEIGHT 50000)
(define PERSON-WEIGHT 250)


;; -- Data Definition

;; TickectPrice (tp) is a Number
;; interp. a non-negative number defining the airfare in USD


;; -- Functions

;; TicketPrice -> Number
;; Given a TicketPrice, produces estimated profit per flight in USD
(check-expect (airline-profit 200) (- 24000 (total-costs 200)))

(define (airline-profit tp)
  (- (airfare-profits tp) (total-costs tp)))

;; TicketPrice -> Number
;; Given TicketPrice, produces estimated airfare-profits in USD

(define (airfare-profits tp)
  (* (passengers-onboard tp) tp))

;; TicketPrice -> Natural
;; Given TicketPrice, produces estimated number of passengers onboard
(check-expect (passengers-onboard 200) 120)
(check-expect (passengers-onboard 210) 116)
(check-expect (passengers-onboard 190) 124)

(define (passengers-onboard tp)
  (- 120 (* (- tp 200) (/ 4 10))))

;; TicketPrice -> Natural
;; Given TicketPrice, produces the estimated number of people onboard
(check-expect (persons-onboard 210) 120)
(check-expect (persons-onboard 200) 124)
(check-expect (persons-onboard 190) 128)
(check-expect (persons-onboard 180) 132)

(define (persons-onboard tp)
  (+ (passengers-onboard tp) 4))


;; TicketPrice -> Number
;; Given TicketPrice, produces the estimated weight of the full plane
(check-expect (full-weight-of-plane 200) (+ (* 124 250) 50000))

(define (full-weight-of-plane tp)
  (+ (* (persons-onboard tp) PERSON-WEIGHT)
     PLANE-WEIGHT))

;; TicketPrice -> Number
;; Given TicketPrice, produces the estimated jet-fuel spent
(check-expect (fuel-spent 200) (/ 81000 20))

(define (fuel-spent tp)
  (/ (full-weight-of-plane tp) 20))

;; TicketPrice -> Number
;; Given TicketPrice, produces the estimated jet-fuel costs
(check-expect (fuel-costs 200) (* 4050 2.999))

(define (fuel-costs tp)
  (* (fuel-spent tp) FUEL-PRICE-PER-GALLON))

;; TicketPrice -> Number
;; Given TicketPrice, produces the estimated total costs
(check-expect (total-costs 200) (+ (fuel-costs 200) 450))

(define (total-costs tp)
  (+ (fuel-costs tp) SALARIES))

