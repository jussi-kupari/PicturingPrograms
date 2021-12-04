;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2447_UNFINISHED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 24.4.7
Re-write the binary-add1 function of Exercise 24.4.3 so that it takes
in an ordinary whole number, but is still written using the binary template rather than
calling the built-in add1 or +. For example,
(check-expect (binary-add1 5) 6)|#