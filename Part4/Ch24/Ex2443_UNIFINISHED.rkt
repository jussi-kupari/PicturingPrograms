;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2443_UNIFINISHED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 24.4.3
Develop a function binary-add1 that takes in a built-binary-whole
and returns the next larger built-binary-whole. For example, the next larger whole after
5 is 6, so
(check-expect (binary-add1 (S1 (S0 (S1 0)))) (S0 (S1 (S1 0))))|#