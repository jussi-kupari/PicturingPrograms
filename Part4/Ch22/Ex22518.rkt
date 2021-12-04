;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22518) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.18 Develop a function count-blocks that takes in a list of numbers,
; which may contain some repetitions, and tells how many blocks of repeated numbers there
; are. A block is one or more copies of the same number appearing in the list, with no other
; numbers in between. For example,
; 
; (check-expect (count-blocks
; (cons 3 (cons 3 (cons 2 (cons 7 (cons 7 (cons 7
; (cons 2 (cons 2 empty)))))))))
; 4)
; because this list has a block of 3’s, then a block of 2’s, then a block of 7’s, then another
; block of 2’s: four blocks in all.
; Hint: I know of at least two ways to solve this problem. Both involve useful techniques
; that you should know; try both.
; First, try writing a version of this function that only works on non-empty lists; as in
; Exercise 22.5.17, the base case becomes “is the list one element long?”. For one-element
; lists, the answer is easy; for longer lists, you know that the list has both a first and a
; second element, and can reasonably ask whether they’re the same. Once this works on
; all non-empty lists, add an “empty” case.
; The other approach is to write a helper function that takes in not only a list of
; numbers but also the number we’re “already looking at:” if the list is non-empty, you can
; reasonably check whether its first number is the same as the one you’re already looking
; at.


;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons number LON)
;; interp. a list of numbers

;; -- Data Definition

;; NELON (NonEmptyListOfNumbers) is one of:
;; - (cons number empty)
;; - (cons number NELON)
;; interp. a non-empty list of numbers

;; -- Functions

;; count-blocks : NELON -> Number
;; Given a NELON, produces the number of repeated blocks of numbers
(check-expect (count-blocks (cons 5 empty)) 1)
(check-expect (count-blocks (cons 5 (cons 5 (cons 1 (cons 2 empty))))) 3)

(check-expect
 (count-blocks
  (cons 3
        (cons 3
              (cons 2
                    (cons 7
                          (cons 7
                                (cons 7
                                      (cons 2 (cons 2 empty)))))))))
 4)

(define (count-blocks nelon)
  (cond
    [(empty? (rest nelon)) 1]
    [else (if (= (first nelon) (first (rest nelon)))
          (count-blocks (rest nelon))
          (add1 (count-blocks (rest nelon))))]))
