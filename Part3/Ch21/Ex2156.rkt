;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2156) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.5.6
; Develop a function add-a-vote that takes in a candidate structure and
; adds one to his/her vote count.

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

;; add-a-vote : Candidate -> Candidate
;; Given a candidate, adds one vote to his/her votes

(check-expect (add-a-vote (make-candidate "jack dempsey" 123))
              (make-candidate "jack dempsey" 124))

(define (add-a-vote cand)
  (make-candidate (candidate-name cand)
                  (add1 (candidate-votes cand))))