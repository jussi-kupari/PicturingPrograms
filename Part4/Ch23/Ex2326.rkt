;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2326) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.6
; Develop a function add-vote-for that takes in a string (representing a candidate’s name) and a list of
; candidate structures, and returns a list of candidate structures in which that candidate has one more vote
; (and all the others are unchanged). You may assume that no name appears more than once in the list.
; 
; Hint: What should you do if the name doesn’t appear in the list at all?


;; -- Data Definitions

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

;; LOC (ListOfCandidates) is one of:
;; - empty
;; - (cons candidate LOC)


;; -- Functions

;; add-vote-for : String LOC -> LOC
;; Given a string (name of candidate) and a LOC, produces the LOC with one vote added to the candidate in question.
(check-expect
 (add-vote-for "Nancy" empty)
 empty)
(check-expect
 (add-vote-for "Nancy" (cons (make-candidate "Amy" 34) empty))
 (cons (make-candidate "Amy" 34) empty))
(check-expect
 (add-vote-for "Nancy" (cons (make-candidate "Amy" 34) (cons (make-candidate "Nancy" 45) empty)))
 (cons (make-candidate "Amy" 34) (cons (make-candidate "Nancy" 46) empty)))
(check-expect
 (add-vote-for "Joe" (cons (make-candidate "Amy" 34) (cons (make-candidate "Nancy" 45) empty)))
 (cons (make-candidate "Amy" 34) (cons (make-candidate "Nancy" 45) empty)))

(define (add-vote-for s loc)
  (cond
    [(empty? loc) empty]
    [else (if (string=? (candidate-name (first loc)) s)
              (cons (make-candidate (candidate-name (first loc))
                                    (add1 (candidate-votes (first loc))))
                    (add-vote-for s (rest loc)))
              (cons (first loc) (add-vote-for s (rest loc))))]))