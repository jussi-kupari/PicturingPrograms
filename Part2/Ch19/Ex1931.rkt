;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1931) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 19.3.1
; Modify the solution to Exercise 15.1.4 so that if the input to reply isn’t
; any of the known strings, it produces an error message and never returns, rather than
; returning "huh?".



;; String -> String
;; Given one of the strings: "good morning", "good afternoon", or "good night"
;; produces either: "I need coffee", "I need a nap", "bedtime!" or an error message
(check-expect (reply "good morning") "I need coffee")
(check-expect (reply "good afternoon") "I need a nap")
(check-expect (reply "good night") "bedtime!")
(check-error (reply "top of the morning!") "reply: no answer available for this greeting")

(define (reply s)
  (cond[(string=? "good morning" s) "I need coffee"]
       [(string=? "good afternoon" s) "I need a nap"]
       [(string=? "good night" s) "bedtime!"]
       [else (error "reply: no answer available for this greeting")]))  