;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1514) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 15.1.4
; 
; Develop a function reply which recognizes any one of the
; strings "good morning", "good afternoon", or "good night", and returns either "I
; need coffee", "I need a nap", or "bedtime!" respectively. If the input isn’t any of
; the three known strings, the function may produce an error message.


;; String -> String
;; Given one of the strings: "good morning", "good afternoon", or "good night"
;; produces either: "I need coffee", "I need a nap", or "bedtime!"
(check-expect (reply "good morning") "I need coffee")
(check-expect (reply "good afternoon") "I need a nap")
(check-expect (reply "good night") "bedtime!")

(define (reply s)
  (cond[(string=? "good morning" s) "I need coffee"]
       [(string=? "good afternoon" s) "I need a nap"]
       [(string=? "good night" s) "bedtime!"]
       [else "huh?"]))  ;; note true can be used instead of else