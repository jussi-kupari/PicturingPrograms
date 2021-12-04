;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1536) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.3.6
; Develop a function rough-age that takes in a
; number representing a person’s age and returns one of the strings
; "child", "teenager", or "adult" as appropriate.
; A “teenager” is at least 13 but less than 20 years old.
; A “child” is under 13 and an “adult” is at least 20.


;; Number -> String
;; Given person's age, produces "child", "teenager", or "adult" as appropriate
(check-expect (rough-age 13) "teenager")
(check-expect (rough-age 19) "teenager")
(check-expect (rough-age 20) "adult")
(check-expect (rough-age 12) "child")

(define (rough-age n)
  (cond
    [(< n 13) "child"]
    [(> n 19) "adult"]
    [else "teenager"]))