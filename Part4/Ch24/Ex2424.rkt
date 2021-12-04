;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2424) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.2.4
Develop a function increasing-table-of-squares which takes in
a whole number n and returns a list of posns representing a table of numbers and their
squares from 0 up to the given number.|#

;; -- Data Definition

;; LOP (List-Of-Posn) is one of:
;; - empty
;; - (cons Posn LOP)
;; interp. a list of Posns


;; -- Functions

;; increasing-table-of-squares : Natural -> LOP
;; Given a Natural, creates a LOP of the numbers (posn-x) and their squares (posn-y)
;; and sorts it from 0 to the given number
(check-expect (increasing-table-of-squares 0)
              (cons (make-posn 0 0) empty))
(check-expect (increasing-table-of-squares 2)
              (cons (make-posn 0 0) (cons (make-posn 1 1) (cons (make-posn 2 4) empty))))

(define (increasing-table-of-squares n) ; function composition
  (sort-increasing (create-lop n)))


;; create-lop : Natural -> LOP
;; Given a Natural, produces a LOP of the numbers and their squares down to zero
(check-expect (create-lop 0)
              (cons (make-posn 0 0) empty))
(check-expect (create-lop 1)
              (cons (make-posn 1 1) (cons (make-posn 0 0) empty)))
(check-expect (create-lop 2)
              (cons (make-posn 2 4) (cons (make-posn 1 1) (cons (make-posn 0 0) empty))))

(define (create-lop n)
  (cond
    [(< n 0) empty]
    [else
     (cons (make-posn n (sqr n))
           (create-lop (sub1 n)))]))



;; sort-increasing : LOP -> LOP
;; Given a LOP, sorts it in increasing order of number size
(check-expect (sort-increasing empty)
              empty)
(check-expect (sort-increasing (cons (make-posn 0 0) empty))
              (cons (make-posn 0 0) empty))
(check-expect (sort-increasing (cons (make-posn 0 0) (cons (make-posn 1 1) empty)))
              (cons (make-posn 0 0) (cons (make-posn 1 1) empty)))
(check-expect (sort-increasing (cons (make-posn 1 1) (cons (make-posn 0 0) empty)))
              (cons (make-posn 0 0) (cons (make-posn 1 1) empty)))

(define (sort-increasing lop)
  (cond
    [(empty? lop) empty]
    [else
     (insert (first lop)
          (sort-increasing (rest lop)))])) ;remember that the result of NR is already sorted!!


;; insert : Posn LOP -> LOP
;; Given a Posn and a *SORTED* LOP, insert the Posn in the correct position in the LOP
;; ASSUME LOP IS ALREADY SORTED
(check-expect (insert (make-posn 0 0) empty) (cons (make-posn 0 0) empty))
(check-expect (insert (make-posn 0 0) (cons (make-posn 1 1) (cons (make-posn 2 4) empty)))
              (cons (make-posn 0 0) (cons (make-posn 1 1) (cons (make-posn 2 4) empty))))
(check-expect (insert (make-posn 1 1) (cons (make-posn 0 0) (cons (make-posn 2 4) empty)))
              (cons (make-posn 0 0) (cons (make-posn 1 1) (cons (make-posn 2 4) empty))))
(check-expect (insert (make-posn 2 4) (cons (make-posn 0 0) (cons (make-posn 1 1) empty)))
              (cons (make-posn 0 0) (cons (make-posn 1 1) (cons (make-posn 2 4) empty))))

(define (insert pos lop)
  (cond
    [(empty? lop) (cons pos empty)]
    [else
     (if (larger? pos (first lop))
         (cons (first lop) (insert pos (rest lop)))
          (cons pos lop))]))


;; larger? : Posn Posn -> Boolean
;; Given two Posns, produces true if the first one has larger posn-x
(check-expect (larger? (make-posn 0 0) (make-posn 0 0)) false)
(check-expect (larger? (make-posn 0 0) (make-posn 1 1)) false)
(check-expect (larger? (make-posn 2 4) (make-posn 1 1)) true)

(define (larger? pos1 pos2)
  (> (posn-x pos1) (posn-x pos2)))




