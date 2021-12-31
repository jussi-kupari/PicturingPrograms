;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2362) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.6.2
Develop a function named sort-candidates that takes in a list of
candidate structures and returns a list of the same candidate structures in decreasing
order by number of votes, so the winner is first in the list, the second-place winner is
second, etc.. In case of ties, either order is acceptable.|#

;; -- Data Definitions

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

(define A1 (make-candidate "a" 1))
(define B3 (make-candidate "b" 3))
(define C5 (make-candidate "c" 5))

;; LOC (ListOfCandidates) is one of:
;; - empty
;; - (cons candidate LOC)

;; -- Functions

;; sort-candidates : LOC -> LOC
;; Given a LOC, produces a LOC in a larger-to-smaller order by number of votes
(check-expect (sort-candidates empty) empty)
(check-expect (sort-candidates (cons (make-candidate "Tom" 24) empty))
              (cons (make-candidate "Tom" 24) empty))
(check-expect (sort-candidates
               (cons (make-candidate "Tom" 24) (cons (make-candidate "Jerry" 23) empty)))
              (cons (make-candidate "Tom" 24) (cons (make-candidate "Jerry" 23) empty)))
(check-expect (sort-candidates
               (cons (make-candidate "Tom" 24) (cons (make-candidate "Jerry" 25) empty)))
              (cons (make-candidate "Jerry" 25) (cons (make-candidate "Tom" 24) empty)))

(define (sort-candidates loc)
  (cond
    [(empty? loc) empty]
    [else
     (insert (first loc)
             (sort-candidates (rest loc)))])) ;result of the natural recursion is already sorted!

;; larger-or-equal? : Number Number -> Boolean
;; Given two numbers, produces true if the first is larger or equal than the second
(check-expect (larger-or-equal? 10 8) true)
(check-expect (larger-or-equal? 10 10) true)
(check-expect (larger-or-equal? 10 11) false)

(define (larger-or-equal? n1 n2)
  (>= n1 n2))

;; insert : Candidate LOC -> LOC
;; Given a candidate and a LOC, inserts the candidate at the correct position
;;(assume that the LOC is already sorted!)
(check-expect (insert A1 (cons C5 (cons B3 empty)))
              (cons C5 (cons B3 (cons A1 empty))))
(check-expect (insert B3 (cons C5 (cons A1 empty)))
              (cons C5 (cons B3 (cons A1 empty))))
(check-expect (insert C5 (cons B3 (cons A1 empty)))
              (cons C5 (cons B3 (cons A1 empty))))

(define (insert c loc)
  (cond
    [(empty? loc) (cons c empty)]
    [else
     (if (larger-or-equal? (candidate-votes c) (candidate-votes (first loc)))
         (cons c loc)
         (cons (first loc) (insert c (rest loc))))]))