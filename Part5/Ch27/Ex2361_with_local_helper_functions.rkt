;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2361_with_local_helper_functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.6.1
Develop a function sort that takes in a list of numbers and returns a list of the same
numbers in increasing order.

Hint: There are several possible ways to do this. If you use an input template, you’ll
probably need a helper function that inserts a number in order into an already-sorted
list. If you use an output template, you’ll probably need two helper functions: one
to find the smallest element in an unsorted list, and one to remove a specified element
from an unsorted list. In either case, I recommend treating list-of-numbers
and sorted-list-of-numbers as two separate types: when a function produces a sorted
list, or assumes that it is given a sorted list, say so in the contract and inventory, and
make sure your test cases satisfy the assumption.|#

;; -- Data Definition

;; LON (List-Of-Numbers) in one of:
;; - empty
;; - (cons number LON)
;; interp. a list of numbers

;; -- Functions

;; == with locally defined helper functions ==

;; sort-numbers : LON -> LON
;; Given a LON, produces a LON in a smaller->larger sorted order
(check-expect (sort-numbers (cons 3 (cons 1 (cons 2 empty))))
              (cons 1 (cons 2 (cons 3 empty))))

(define (sort-numbers lon)
  (local [(define (smaller-or-equal? n1 n2) (<= n1 n2))
          (define (insert n lon)
            (cond
              [(empty? lon) (cons n empty)]
              [else
               (if (smaller-or-equal? n (first lon))
                   (cons n lon)
                   (cons (first lon) (insert n (rest lon))))]))]
    (cond
      [(empty? lon) empty]
      [else
       (insert (first lon)
               (sort-numbers (rest lon)))]))) ;result of the natural recursion is already sorted!