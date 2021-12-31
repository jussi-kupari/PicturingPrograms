;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2356) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.6
Develop a function words that takes in a string and returns a list of strings, one for each
word in the input string, leaving out any spaces, punctuation, numbers, etc. A “word” is defined
as in Exercise 22.7.4: a sequence of one or more letters.

For example,
(check-expect (words "This is chapter 26, or is it 25?")
(list "This" "is" "chapter" "or" "is" "it"))|#

;; -- Data Definition

;; LOS (List-Of-String) is one of:
;; - empty
;; (cons String LOS)
;; interp. a list of strings

;; -- Functions

;; words : String -> LOS
;; Given a string, produces a list of the alphabetic words in the string
(check-expect
 (words "My name is Sam.")
 (cons "My" (cons "name" (cons "is" (cons "Sam" empty)))))

(check-expect
 (words "Hello, what is your name?")
 (cons "Hello" (cons "what" (cons "is" (cons "your" (cons "name" empty))))))

(define (words s)
  (cond
    [(zero? (string-length s)) empty]
    [else
     (if (zero? (count-consecutive-alphabets s))
         (words (substring s 1))
         (cons (substring s 0 (count-consecutive-alphabets s))
               (words (substring s (count-consecutive-alphabets s)))))]))

;; count-consecutive-alphabets : String -> Natural
;; Given an string, produces the number of consecutive alphabets from the start of the string
(check-expect (count-consecutive-alphabets "") 0)
(check-expect (count-consecutive-alphabets "abc") 3)
(check-expect (count-consecutive-alphabets "abcd ") 4)
(check-expect (count-consecutive-alphabets "abcde1") 5)

(define (count-consecutive-alphabets s)
  (cond
    [(zero? (string-length s)) 0]
    [else
     (if (string-alphabetic? (string-ith s 0))
         (+ 1 (count-consecutive-alphabets (substring s 1)))
         0)]))