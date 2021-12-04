;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2363_UNSOLVED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.6.3 Develop a function subsets that takes in a list (of numbers, strings,
it doesn’t matter) and returns a list of lists representing all possible subsets of the elements
in the original list, once each. For example, (subsets (list "a" "b" "c")) should
produce something like:

(list (list)
(list "a")
(list "b")
(list "a" "b")
(list "c")
(list "a" "c")
(list "b" "c")
(list "a" "b" "c"))
You may assume that all the things in the input list are different.
|#