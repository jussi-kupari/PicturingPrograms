;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1534) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.3.4 The town of Racketville needs a new computerized voting system.
; In an early version of the system, we assume there are exactly 4 voters
; (we’ll see later how to handle an arbitrary number of voters).
; Develop a function count-votes-4 that takes in five strings. The first is the
; name of a candidate, and the other four are votes which might or might not be
; for that candidate. The function should return how many of the votes are for
; the specified candidate. For example,
; 
; (check-expect
; (count-votes-4 "Anne" "Bob" "Charlie" "Bob" "Hortense") 0)
; ; since there are no votes for Anne
; (check-expect
; (count-votes-4 "Anne" "Bob" "Anne" "Phil" "Charlie") 1)
; (check-expect
; (count-votes-4 "Anne" "Anne" "Bob" "Anne" "Mary") 2)
; (check-expect
; (count-votes-4 "Bob" "Anne" "Bob" "Charlie" "Bob") 2)
; 
; Hint: Write an auxiliary function that takes in two strings and returns
; either 1 (if they match) or 0 (if they don’t). Obviously, it’s a pain passing
; around four votes as parameters, and it would be even worse if you had hundreds
; or thousands of votes.
; 
; We’ll see how to handle larger numbers of data in Chapter 22.


;; String String String String -> Natural
;; Given the name of candidate and the names from three votes
;; produce the number of votes for candidate
(check-expect (count-votes-4 "amy" "amy" "amy" "amy") 3)
(check-expect (count-votes-4 "amy" "amy" "amy" "bob") 2)
(check-expect (count-votes-4 "amy" "amy" "bob" "bob") 1)
(check-expect (count-votes-4 "amy" "bob" "bob" "bob") 0)

(define (count-votes-4 s1 s2 s3 s4)
  (cond
    [(and (string=? s1 s2)
          (string=? s1 s3)
          (string=? s1 s4)) 3]
    [(and (string=? s1 s2)
          (string=? s1 s3)) 2]
    [(and (string=? s1 s3)
          (string=? s1 s4)) 2]
    [(and (string=? s1 s2)
          (string=? s1 s4)) 2]
    [(or (string=? s1 s2)
         (string=? s1 s3)
         (string=? s1 s4)) 1]
    [else 0]))