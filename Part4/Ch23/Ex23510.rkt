;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex23510) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 23.5.10
Design a function basic-mad-lib that takes in a string (the template) and a non-empty list of
strings, and returns a string. The template may contain ordinary words and punctuation, as well
as the hyphen character (-). The output of the function should be based on the template, but it
should replace each - with a randomly-chosen word from the list of words.

For example,
(basic-mad-lib "The - bit the - and took a - home."
(list "dog" "cat" "senator" "taxi" "train" "chair"))

could be "The chair bit the dog and took a senator home."|#

;; -- Data Definitions

;; NELOS (Non-Empty-List-Of-Strings) is on of:
;; - (cons String empty)
;; - (cons String NELOS)
;; - interp. a non-empty list of strings

;; -- Functions

;; basic-mad-lib : String NELOS -> String
;; Given a string and a NELOS, produces a string as a quasi-random combination of the inputs.

(define (basic-mad-lib s nelos)
  (cond
    [(zero? (string-length s)) ""]
    [else
     (if (and (space? (string-ith s 0))
              (hyphen? (string-ith s 1)))
         (string-append " "
                        (random-word nelos)
                        (basic-mad-lib (substring s 2) nelos))
         (string-append (string-ith s 0)
                        (basic-mad-lib (substring s 1) nelos)))]))

;; space? : String -> Boolean
(check-expect (space? "") false)
(check-expect (space? " ") true)
(define (space? s)
  (string=? s " "))

;; hyphen? : String -> Boolean
(check-expect (hyphen? "") false)
(check-expect (hyphen? "-") true)
(define (hyphen? s)
  (string=? s "-"))

;; random-word : NELOS -> String
(check-member-of
 (random-word (cons "a" (cons "b" (cons "c" empty))))
 "a" "b" "c")
(define (random-word nelos)
  (list-ref nelos (random (length nelos))))