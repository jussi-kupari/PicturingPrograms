;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2327) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.7
; Develop a function tally-votes that takes in a list of strings (Voter1’s favorite candidate, Voter 2’s favorite candidate, etc.)
; and produces a list of candidate structures in which each candidate’s name appears once, with how many votes were cast
; for that candidate.


;; -- Data Definitions

;; LOS (List-Of-String) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

;; LOC (ListOfCandidates) is one of:
;; - empty
;; - (cons candidate LOC)


;; -- Functions

;; tally-votes : LOS -> LOC
;; Given a LOS (names of candidates), produces a LOC with votes per candidate collected from the LOS
(check-expect
 (tally-votes empty) empty)
(check-expect
 (tally-votes (cons "Amy" (cons "John" (cons "Amy" empty))))
 (cons (make-candidate "Amy" 2) (cons (make-candidate "John" 1) empty)))
(check-expect
 (tally-votes (cons "Amy" (cons "Amy" (cons "John" (cons "Matt" (cons "John" (cons "Amy" empty)))))))
 (cons (make-candidate "Amy" 3) (cons (make-candidate "John" 2) (cons (make-candidate "Matt" 1) empty))))


(define (tally-votes los)
  (cond
    [(empty? los) empty]
    [else (cons (make-candidate
                 (first los)
                 (add1 (count-name (first los) (rest los))))
                (tally-votes (remove-name (first los) (rest los))))]))


;; count-name : String LOS -> Natural
;; Given a String (name of candidate) and a LOS, produces the count of the name in the list
(check-expect (count-name "Amy" empty) 0)
(check-expect (count-name "Amy" (cons "Amy" empty)) 1)
(check-expect (count-name "Amy" (cons "Matt" (cons "Amy" (cons "John" (cons "Amy" empty))))) 2)

(define (count-name s los)
  (cond
    [(empty? los) 0]
    [else (if (string=? s (first los))
              (add1 (count-name s (rest los)))
              (count-name s (rest los)))]))

;; remove-name : String -> LOS
;; Given a string (name of candidate) and a LOS, produces the LOS with all instances of the name removed
(check-expect (remove-name "Amy" empty) empty)
(check-expect (remove-name "Amy" (cons "Amy" empty)) empty)
(check-expect (remove-name "Amy" (cons "Matt" (cons "Amy" (cons "John" empty)))) (cons "Matt" (cons "John" empty)))

(define (remove-name s los)
  (cond
    [(empty? los) empty]
    [else (if (string=? s (first los))
              (remove-name s (rest los))
              (cons (first los) (remove-name s (rest los))))]))
