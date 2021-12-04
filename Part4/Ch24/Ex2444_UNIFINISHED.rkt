;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2444_UNIFINISHED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 24.4.4
Develop a function bbw-value that takes in a built-binary-whole
and returns the (ordinary) whole number that it represents. For example,
(check-expect (binary-whole-value 0) 0)
(check-expect (binary-whole-value (S1 0)) 1)
(check-expect (binary-whole-value (S0 (S1 (S1 (S0 (S1 0)))))) 22)|#