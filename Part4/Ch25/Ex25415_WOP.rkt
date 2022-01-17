;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25415_WOP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.15
Develop a function lcsubsequence (“longest common subsequence”) that takes in
two strings and returns the longest string which is a subsequence of both of
them. For example,
(check-expect (lcsubsequence "mickey mouse" "minnie moose")
"mie mose")

The answer may not be unique: for example, (lcsubsequence "abc" "cba") could
legitimately be any of the strings "a", "b", or "c".

Hint: As in exercise 25.4.14, your program may be slow. My first attempt took about
2.5 seconds to solve (lcsubsequence "mickey mouse" "minnie moose"), and I don’t
know of a more efficient way to do it using what you’ve already seen. A technique called
dynamic programming or memoization, which we’ll discuss in Chapter 30, enabled me to
do it in about 0.01 seconds.Again, the difference is more dramatic for longer strings.
|#

#|
The key is to come up with a function that creates a list of all the subsequences of a given string.
|#