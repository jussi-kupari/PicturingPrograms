;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2365_UNSOLVED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.6.5
Develop a function scramble-word that takes in a string and returns
a list of strings representing all possible orderings of the characters in the string.
For a basic version of this function, you may include the same string more than once:
for example, (scramble-word "foo") might produce (list "foo" "ofo" "oof" "foo"
"ofo" "oof") Once you have this working, try rewriting it so it doesn’t produce any
duplicates: (scramble-word "foo") might produce (list "foo" "ofo" "oof") instead.
Hint: Re-use functions you’ve already written!|#