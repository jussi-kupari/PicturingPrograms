;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2264) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.6.4
; Develop a function total-votes that takes in a list of candidate structures (from Exercise 21.3.3)
; and returns the total number of votes cast in the election.


;; -- Data Definitions

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

;; LOC (ListOfCandidates) is one of:
;; - empty
;; - (cons candidate LOC)


;; -- Functions

;; total-votes : LOC -> Natural
;; Given a LOC, returns the total sum of votes cast
(check-expect (total-votes empty) 0)
(check-expect (total-votes
               (cons (make-candidate "john" 50) empty)) 50)
(check-expect (total-votes
               (cons (make-candidate "john" 50)
                     (cons (make-candidate "mary" 70) empty))) (+ 50 (+ 70 0)))

(define (total-votes loc)
  (cond
    [(empty? loc) 0]
    [else (+ (candidate-votes (first loc))
             (total-votes (rest loc)))]))
