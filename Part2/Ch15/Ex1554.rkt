;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1554) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.5.4
; Three candidates (Anne, Bob, and Charlie) are running for mayor of
; Racketville, which, by court order, has a new computerized voting
; system. Develop a function named who-won that takes in three numbers
; (the number of votes for Anne, the number of votes for Bob, and the
; number of votes for Charlie, respectively) and returns a string
; indicating who won – either "Anne", "Bob", or "Charlie". If two or
; more candidates tied for first place, the function should return "tie".


;; Natural Natural Natural -> String
;; Given the votes for the three candidates, produces the name of the winner
(check-expect (who-won 1 2 3) "Charlie")
(check-expect (who-won 1 2 2) "tie")
(check-expect (who-won 6 0 1) "Anne")
(check-expect (who-won 2 4 2) "Bob")

(define (who-won n1 n2 n3)
  (cond[(and (> n1 n2)
             (> n1 n3)) "Anne"]
       [(and (> n2 n1)
             (> n2 n3)) "Bob"]
       [(and (> n3 n1)
             (> n3 n2)) "Charlie"]
       [else "tie"]))