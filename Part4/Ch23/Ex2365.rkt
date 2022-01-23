;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2365) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 23.6.5
Develop a function scramble-word that takes in a string and returns
a list of strings representing all possible orderings of the characters in the string.
For a basic version of this function, you may include the same string more than once:
for example, (scramble-word "foo") might produce (list "foo" "ofo" "oof" "foo"
"ofo" "oof") Once you have this working, try rewriting it so it doesn’t produce any
duplicates: (scramble-word "foo") might produce (list "foo" "ofo" "oof") instead.
Hint: Re-use functions you’ve already written!|#

;; -- Data Definitions

;; List-of-Atoms (LOA) is one of:
;; - empty
;; - (cons Atom LOA)

;; List-of-LOA (LOLOA) is one of:
;; - empty
;; - (cons LOA LOLOA)

;; List-of-Chars (LOCH) is one of:
;; - empty
;; - (cons Char LOCH)

;; List-of-LOCH (LOLOCH) is one of:
;; - empty
;; - (cons LOCH LOLOCH)

;; -- Functions

;; scramble-word : String -> LOS
;; Given String, produces a LOS with all the permutations of the letters in the string
(check-expect (scramble-word "") empty)
(check-expect (scramble-word "foo")
              (list "oof" "ofo" "foo"))

(define (scramble-word s)
  (cond
    [(zero? (string-length s)) empty]
    [else
     (keep-unique
      (collapse-to-strings
       (scramble (string->list s))))]))

;; keep-unique : LOS -> LOS
;; Given a LOS, removes strings that appear more than once
(check-expect (keep-unique empty) empty)
(check-expect (keep-unique (list "foo" "ofo" "oof" "foo" "ofo" "oof"))
              (list "foo" "ofo" "oof"))

(define (keep-unique los)
  (cond
    [(empty? los) empty]
    [else
     (if (found? (first los) (rest los))
         (keep-unique (rest los))
         (cons (first los) (keep-unique (rest los))))]))

;; found? : String LOS -> Boolean
;; Given String and LOS, produces true if String is found in LOS
(check-expect (found? "a" empty) false)
(check-expect (found? "a" (list "b" "c")) false)
(check-expect (found? "a" (list "d" "a")) true)

(define (found? s los)
  (cond
    [(empty? los) false]
    [else
     (if (equal? s (first los))
         true
         (found? s (rest los)))]))

;; collapse-to-strings : LOLOCH -> LOS
;; Given a LOLOCH, collapses each to LOCH to a string
(check-expect (collapse-to-strings empty) empty)
(check-expect
 (collapse-to-strings (list (list #\f #\o #\o) (list #\o #\f #\o)))
 (list "foo" "ofo"))

(define (collapse-to-strings loloch)
  (cond
    [(empty? loloch) empty]
    [else
     (cons (list->string (first loloch))
           (collapse-to-strings (rest loloch)))]))

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
    [else
     (insert-in-all-lists (first loa) (scramble (rest loa)))]))

;; insert-in-all-lists : Atom LOLOA -> LOLOA
;; Given Atom and LOLOA, produces a LOLOA where Atom is inserted in all position in lists
(check-expect (insert-in-all-lists 1 empty) empty)
(check-expect (insert-in-all-lists 1 (list (list 2 3) (list 3 2)))
              (list
               (list 2 3 1) (list 2 1 3) (list 1 2 3) (list 3 2 1) (list 3 1 2) (list 1 3 2)))

(define (insert-in-all-lists a loloa)
  (cond
    [(empty? loloa) empty]
    [else
     (append (insert-at-all-positions a (first loloa))
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
    [else
     (cons (insert-at-position i a loa)
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
    [else
     (cons (first loa) (insert-at-position (sub1 i) a (rest loa)))]))