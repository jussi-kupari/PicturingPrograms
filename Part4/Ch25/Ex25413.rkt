;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25413) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.13
Develop a function subsequence? that takes in two strings and tells whether the
characters of the first appear in the same order in the second (but possibly
with some other characters in between). For example,
(check-expect (subsequence? "bob" "") false)
(check-expect (subsequence? "" "bob") true)
(check-expect (subsequence? "b" "bob") true)
(check-expect (subsequence? "c" "bob") false)
(check-expect (subsequence? "bob" "bob") true)
(check-expect (subsequence? "bob" "bobs") true)
(check-expect (subsequence? "bob" "brats and snobs") true)
(check-expect (subsequence? "no rat" "brats and snobs") false)
(check-expect (subsequence? "bob" "thingbobs") true)
(check-expect (subsequence? "bob" "I botched it but bob fixed it")
true)
(check-expect (subsequence? "bob" "I botched it but amy fixed it")
true)

I don’t think there’s a built-in Racket function that will help much with this, but in any
case, I want you to do this using only char=?, comparing one character at a time.
Hint: Perhaps surprisingly, this problem is easier than substring?.|#


;; -- Functions

;; subsequence? : String String -> Boolean
;; Given two strings, produces true if the characters
;; of the first appear in the same order in the second
(check-expect (subsequence? "bob" "") false)
(check-expect (subsequence? "" "bob") true)
(check-expect (subsequence? "b" "bob") true)
(check-expect (subsequence? "c" "bob") false)
(check-expect (subsequence? "bob" "bob") true)
(check-expect (subsequence? "bob" "bobs") true)
(check-expect (subsequence? "bob" "brats and snobs") true)
(check-expect (subsequence? "no rat" "brats and snobs") false)
(check-expect (subsequence? "bob" "thingbobs") true)
(check-expect (subsequence? "bob" "I botched it but bob fixed it") true)
(check-expect (subsequence? "bob" "I botched it but amy fixed it") true)

(define (subsequence? s1 s2)
  (cond
    [(< (string-length s2) (string-length s1)) false]
    [(zero? (string-length s1)) true]
    [else
     (if (equal? (substring s1 0 1) (substring s2 0 1))
              (subsequence? (substring s1 1) (substring s2 1))
              (subsequence? s1 (substring s2 1)))]))