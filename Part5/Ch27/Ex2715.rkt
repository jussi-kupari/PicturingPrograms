;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2715) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.1.5
Consider the functions binary-add1 from Exercise 24.4.3, binary-add
from Exercise 25.4.9, binary-mult from Exercise 25.4.10, and binary-raise from Exercise 25.4.11.
Which of these (if any) would benefit from this treatment? Why?|#

#|binary-add1 from Exercise 24.4.3 computes (0ne-half bbw) four times, so that functions could likely benefit
from saving the result as a local varible. The other functions do not make specific computations several times
in one fuction call|#