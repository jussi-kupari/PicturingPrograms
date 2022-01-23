;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2364) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 23.6.4
Develop a function scramble that takes in a list (of numbers, strings,
it doesn’t matter) and returns a list of lists representing all possible orderings of the el-
ements in the original list, once each. For example, (scramble (list "a" "b" "c" ))
should produce something like
(list (list "a" "b" "c")
(list "b" "a" "c")
(list "a" "c" "b")
(list "c" "a" "b")
(list "b" "c" "a")
(list "c" "b" "a"))
Again, you may assume that all the things in the input list are different. Even better,
decide what the function should do if there are duplicate elements in the input list, and
make sure it does the right thing.

Hint: This will probably require more than one helper function. Take it one step at
a time: try to write the main function, figure out what you need to do to the recursive
result, invent a function to do that, and repeat until what you need to do is built-in.

I used Atoms here. This was definitely quite a challenge and I ended up doing quite a
lot of trial-and-error work. the list-of-lists structure makes me trip easily - especially
the 'empty' - when using the different annotation types ('list' and 'cons').
|#

;; -- Data Definitions

;; List-of-Atoms (LOA) is one of:
;; - empty
;; - (cons Atom LOA)

;; List-of-LOA (LOLOA) is one of:
;; - empty
;; - (cons LOA empty)

;; -- Functions

;; scramble :: LOA -> LOLOA
;; Given a LOA, produces a LOLOA of all permutations the elements in LOA
(check-expect (scramble empty) (list empty))
(check-expect (scramble (list 1 2 3))
              (list
               (list 3 2 1)
               (list 3 1 2)
               (list 1 3 2)
               (list 2 3 1)
               (list 2 1 3)
               (list 1 2 3)))

(define (scramble loa)
  (cond
    [(empty? loa) (list empty)]
    [else (insert-in-all-lists (first loa) (scramble (rest loa)))]))

;; insert-in-all-lists : Atom LOLOA -> LOLOA
;; Given Atom and LOLOA, produces a LOLOA where Atom is inserted in all position in lists
(check-expect (insert-in-all-lists 1 empty) empty)
(check-expect (insert-in-all-lists 1 (list (list 2 3) (list 3 2)))
              (list
               (list 2 3 1) (list 2 1 3) (list 1 2 3) (list 3 2 1) (list 3 1 2) (list 1 3 2)))

(define (insert-in-all-lists a loloa)
  (cond
    [(empty? loloa) empty]
    [else (append (insert-at-all-positions a (first loloa))
                  (insert-in-all-lists a (rest loloa)))]))

;; insert-at-all-positions : Atom LOA -> LOLOA
;; Given Atom and a LOA, produces a LOLOA where Atom is inserted in all possible positions
(check-expect (insert-at-all-positions 1 empty)
              (list (list 1)))
(check-expect (insert-at-all-positions 1 (list 2 3))
              (list
               (list 2 3 1)
               (list 2 1 3)
               (list 1 2 3)))

(define (insert-at-all-positions a loa)
  (insert-at-positions (length loa) a loa))

;; insert-at-positions : Index Atom LOA -> LOLOA
;; Given Atom and LOA
;; produces a LOLOA where the Atom is inserted at each position starting from zero to Index
(check-expect (insert-at-positions 0 1 empty)
              (list (list 1)))
(check-expect (insert-at-positions 0 1 (list 2 3))
              (list (list 1 2 3)))
(check-expect (insert-at-positions 2 1 (list 2 3))
              (list
               (list 2 3 1)
               (list 2 1 3)
               (list 1 2 3)))

(define (insert-at-positions i a loa)
  (cond
    [(empty? loa) (list (list a))]
    [(zero? i) (list (cons a loa))]
    [else (cons (insert-at-position i a loa)
                (insert-at-positions (sub1 i) a loa))]))

;; insert-at-position : Index Atom LOA -> LOA
;; Given Index, Atom and LOA, inserts the Atom in the list at given Index
(check-expect (insert-at-position 1 1 empty) (list 1))
(check-expect (insert-at-position 0 1 (list 2 3)) (list 1 2 3))
(check-expect (insert-at-position 1 1 (list 2 3)) (list 2 1 3))
(check-expect (insert-at-position 2 1 (list 2 3)) (list 2 3 1))

(define (insert-at-position i a loa)
  (cond
    [(empty? loa) (list a)]
    [(zero? i) (append (list a) loa)]
    [else (cons (first loa) (insert-at-position (sub1 i) a (rest loa)))]))