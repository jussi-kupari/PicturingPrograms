;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2265) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.6.5
; Develop a function avg-votes that takes in a list of candidate
; structures and returns the average number of votes for each candidate.
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

;; avg-votes : LOC -> Number
;; Given a LOC, produces the average votes per candidate
(check-error (avg-votes empty)
             "Can't compute average for an empty list!")
(check-expect (avg-votes
               (cons (make-candidate "john" 50) empty))
              (/ (+ 50 0) (+ 1 0)))
(check-expect (avg-votes
               (cons (make-candidate "john" 50)
                     (cons (make-candidate "mary" 70) empty)))
              (/ (+ 50 (+ 70 0)) (+ 1 (+ 1 0))))

(define (avg-votes loc)
  (cond
    [(empty? loc)
     (error "Can't compute average for an empty list!")]
    [else (/ (total-votes loc) (total-candidates loc))]))



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

;; total-candidates : LOC -> Natural
;; Given a LOC, produces the number of candidates
(check-expect (total-candidates empty)  0)
(check-expect (total-candidates
               (cons (make-candidate "john" 50) empty)) (+ 1 0))
(check-expect (total-candidates
               (cons (make-candidate "john" 50)
                     (cons (make-candidate "mary" 70) empty))) (+ 1 (+ 1 0)))

(define (total-candidates loc)
  (cond
    [(empty? loc) 0]
    [else (+ 1 (total-candidates (rest loc)))]))
