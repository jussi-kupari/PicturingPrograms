;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2366_UNSOLVED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.6.6
Modify the scramble-word function so that, even if there are repeated
characters in the string, the result won’t contain the same word twice: (scramble-word
"foo") might produce (list "foo" "ofo" "oof").|#