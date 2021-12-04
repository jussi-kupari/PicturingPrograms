;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1541) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Worked Exercise 15.4.1

My bank offers savings accounts with a sliding scale of interest, depending on how much
money is in the account: if you have less than $500 in the account, you earn no interest;
for $500-$1000, you earn 1% per year interest; for $1000-$4000, you earn 2% per year,
and for $4000 and up, you earn 3% per year.

Develop a function bank-interest that computes the annual interest on a savings account
with a specified balance.|#

;; -- Data Definitions

;; Balance is a Number [0,  ]

;; Interest is one of:
;; - 0       ; balance <500
;; - 0.01    ; 500 <= balance < 1000 
;; - 0.02    ; 1000 >= balance < 4000
;; - 0.03    ; balance >= 4000 
;; interp. the amount of interest for a bank-account

;; -- Functions

;; bank-interest : Balance -> Number
;; Given a back-account balance, produces the annual interest
(check-expect (bank-interest 200)              0)
(check-expect (bank-interest 500)  (* 500 0.01))
(check-expect (bank-interest 800)  (* 800 0.01)) ; or 8
(check-expect (bank-interest 1000) (* 1000 0.02))
(check-expect (bank-interest 2500) (* 2500 0.02)) ; or 50
(check-expect (bank-interest 4000) (* 4000 0.03))
(check-expect (bank-interest 5000) (* 5000 0.03)) ; or 150

(define (bank-interest b)
  (cond
    [(< b 500) 0]
    [(and (>= b 500) (< b 1000)) (* b 0.01)]
    [(and (>= b 1000) (< b 4000)) (* b 0.02)]
    [else (* b 0.03)]))



