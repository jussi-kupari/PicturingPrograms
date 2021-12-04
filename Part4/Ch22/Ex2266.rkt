;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2266) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.6.6
; Develop a function winner that takes in a list of candidate structures and returns the one
; with the most votes. If there are two or more tied for first place,
; you can return whichever one you wish.
; 
; Hint: This doesn’t have a reasonable answer if there are no candidates. How do you
; want to handle this case?


;; -- Data Definitions

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

;; LOC (ListOfCandidates) is one of:
;; - empty
;; - (cons candidate LOC)


;; -- Functions

;; winner : LOC -> Candidate
;; Given a LOC, produces the candidate with most votes
(check-error (winner empty) "Can't give the winner for an empty list.")
(check-expect (winner
               (cons (make-candidate "john" 50) empty)) (make-candidate "john" 50))
(check-expect (winner
               (cons (make-candidate "john" 50)
                     (cons (make-candidate "mary" 70) empty))) (make-candidate "mary" 70))
(check-expect (winner
               (cons (make-candidate "john" 70)
                     (cons (make-candidate "mary" 50) empty))) (make-candidate "john" 70))
(define (winner loc)
  (cond
    [(empty? loc) (error "Can't give the winner for an empty list.")]
    [else (if (most-votes? (first loc) (rest loc))
              (first loc)
              (winner (rest loc)))]))

;; most-votes? : Candidate LOC -> Boolean
;; Given a candidate and a LOC, produces true if the candidate has more votes than any in the list
(check-expect
 (most-votes? (make-candidate "tom collins" 100)
              (cons (make-candidate "john" 50)
                     (cons (make-candidate "mary" 70) empty)))
 true)
(check-expect
 (most-votes? (make-candidate "tom collins" 60)
              (cons (make-candidate "john" 50)
                     (cons (make-candidate "mary" 70) empty)))
 false)

(define (most-votes? c loc)
  (cond
    [(empty? loc) true]
    [else (if (< (candidate-votes c) (candidate-votes (first loc)))
              false
              (most-votes? c (rest loc)))]))