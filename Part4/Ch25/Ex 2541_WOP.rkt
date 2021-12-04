;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ex 2541_WOP|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.1
Develop a function cart-prod (short for “Cartesian product”) that
takes in two lists and returns a list of two-element lists, each with an element from the
first input list and an element from the second in that order. The result should include
all possible pairs of elements. You may assume that there are no duplicate elements in
the first list, and no duplicate elements in the second list (although there might be things
that are in both input lists.)

Hint: You’ll need a helper function.|#
