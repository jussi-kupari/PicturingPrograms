;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25412_WOP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.12
Develop a function substring? that takes in two strings and tells
whether the first one appears in the second as a substring. For example,
(check-expect (substring? "bob" "") false)
(check-expect (substring? "" "bob") true)
(check-expect (substring? "b" "bob") true)
(check-expect (substring? "c" "bob") false)
(check-expect (substring? "bob" "bob") true)
(check-expect (substring? "bob" "bobs") true)
(check-expect (substring? "bob" "brats and snobs") false)
(check-expect (substring? "no rat" "brats and snobs") false)
(check-expect (substring? "bob" "thingbobs") true)
(check-expect (substring? "bob" "I botched it but bob fixed it")
true)
(check-expect (substring? "bob" "I botched it but amy fixed it")
false)
(There is a function in some dialects of Racket that does this job, but I want you to
do it using only char=?, comparing one character at a time.)|#