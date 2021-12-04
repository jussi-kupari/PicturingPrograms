;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1621) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Worked Exercise 16.2.1
Write a template for functions that operate on bank balances, as defined in Exercise 15.4.1.
Then use this template to write two functions: bank-interest-rate (as before) and customer-type,
which categorizes customers as "rich", "moderate", "poor", or "college student" depending on
the size of their bank account, using the same dividing lines.|#

;; -- Data Definitions

;; Balance is a Number [0,  ]

;; Interest is one of:
;; - 0       ; balance <500
;; - 0.01    ; 500 <= balance < 1000 
;; - 0.02    ; 1000 >= balance < 4000
;; - 0.03    ; balance >= 4000 
;; interp. the amount of interest for a bank-account

;; Template for Balance

#;
(define (fn-for-balance b)
  (cond
    [(< b 500) (b ...)]
    [(and (>= b 500) (< b 1000)) (b ...)]
    [(and (>= b 1000) (< b 4000)) (b ...)]
    [else (b ...)]))


;; -- Functions


;; bank-interest-rate : Balance -> Number
;; Given a back-account balance, produces the annual interest rate
(check-expect (bank-interest-rate 200)              0)
(check-expect (bank-interest-rate 500)  (* 500 0.01))
(check-expect (bank-interest-rate 800)  (* 800 0.01)) ; or 8
(check-expect (bank-interest-rate 1000) (* 1000 0.02))
(check-expect (bank-interest-rate 2500) (* 2500 0.02)) ; or 50
(check-expect (bank-interest-rate 4000) (* 4000 0.03))
(check-expect (bank-interest-rate 5000) (* 5000 0.03)) ; or 150

(define (bank-interest-rate b)
  (cond
    [(< b 500) 0]
    [(and (>= b 500) (< b 1000)) (* b 0.01)]
    [(and (>= b 1000) (< b 4000)) (* b 0.02)]
    [else (* b 0.03)]))


;; customer-type : Balance -> String
;; Given a bank-account balance, produces a string that idicates customer category
(check-expect (customer-type 200)  "college student")
(check-expect (customer-type 500)             "poor")
(check-expect (customer-type 800)             "poor")
(check-expect (customer-type 1000)        "moderate")
(check-expect (customer-type 1000)        "moderate")
(check-expect (customer-type 3999)        "moderate")
(check-expect (customer-type 4000)            "rich")
(check-expect (customer-type 5000)            "rich")

;(define (customer-type b) "rich") ;stub


(define (customer-type b)
  (cond
    [(< b 500) "college student"]
    [(and (>= b 500) (< b 1000)) "poor"]
    [(and (>= b 1000) (< b 4000)) "moderate"]
    [else "rich"]))
















