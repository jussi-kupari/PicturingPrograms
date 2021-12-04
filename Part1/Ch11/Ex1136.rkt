;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1136) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.3.5
; The nation of Progressiva has a simple tax code. The tax you
; pay is your salary times the tax rate, and the tax rate is 0.5%
; per thousand dollars of salary. For example, if you make $40,000,
; your tax rate is 0.5% times 40, which is 20%, so you pay 20%
; of $40,000, which is $8,000. Develop a function to compute the
; net pay (i.e. pay after taxes) of a person with a given salary.
; 
; Hint: You’ll probably need two auxiliary functions as well as net-pay.


;; Number(salary) -> Number(net pay)
;; Given salary, produces net-pay
(check-expect (get-net-pay 40000) 32000)

(define (get-net-pay s)
  (- s (* s (/ (get-tax-rate s) 100))))


;; Number(gross-pay) -> Number(tax-rate)
;; given gross-pay, produces tax-rate
(check-expect (get-tax-rate 40000) 20)

(define (get-tax-rate s)
  (* (/ s 1000) 0.5))
