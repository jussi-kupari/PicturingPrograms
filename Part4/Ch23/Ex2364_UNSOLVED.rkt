;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2364_UNSOLVED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
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
result, invent a function to do that, and repeat until what you need to do is built-in.|#


;; -- Functions


;; insert-in-all-positions : Natural LON -> LOLON
;; Given natural and LON, produces a LOLON where natural is inserted in all possible positions.
(check-expect (insert-in-all-positions 1 empty)
              (list 1 empty))
(check-expect (insert-in-all-positions 1 (list 2 3))
              (list
               (list 1 2 3)
               (list 2 1 3)
               (list 2 3 1)))

(define (insert-in-all-positions n lon)
  (cond
    [(empty? lon) (list n empty)]
    [else lon]))

