;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1555) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.5.5 Develop a function named 4-votes->winner that takes in four strings
; representing votes, and returns the name of the winner (or "tie" if there was a tie).
; You may assume that the only candidates in the race are "Anne", "Bob", and "Charlie"
; (this makes it much easier!)
; 
; Hint: This should be short and simple if you re-use previously-defined functions.


;; String String String String -> String
;; Given four votes (names), produces the winner or announces a tie
(check-expect (4-votes->winner "Anne" "Anne" "Anne" "Anne") "Anne")
(check-expect (4-votes->winner "Anne" "Anne" "Bob" "Bob") "tie")
(check-expect (4-votes->winner "Anne" "Bob" "Anne" "Bob") "tie")
(check-expect (4-votes->winner "Anne" "Bob" "Bob" "Anne") "tie")
(check-expect (4-votes->winner "Anne" "Anne" "Bob" "Charlie") "Anne")
(check-expect (4-votes->winner "Bob" "Charlie" "Anne" "Anne") "Anne")
(check-expect (4-votes->winner "Anne" "Bob" "Anne" "Charlie") "Anne")
(check-expect (4-votes->winner "Bob" "Anne" "Anne" "Charlie") "Anne")

(define (4-votes->winner s1 s2 s3 s4)
  (cond
    [(and
      (string=? s1 s2)
      (string=? s2 s3)
      (string=? s3 s4)) s1]
    [(and
      (string=? s1 s2)
      (string=? s3 s4)) "tie"]
    [(and
      (string=? s1 s3)
      (string=? s2 s4)) "tie"]
    [(and
      (string=? s1 s4)
      (string=? s2 s3)) "tie"]
    [(string=? s1 s2) s1]
    [(string=? s1 s3) s1]
    [(string=? s3 s4) s3]
    [(string=? s2 s3) s2]))