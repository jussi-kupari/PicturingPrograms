;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2357) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.7
Develop a function pig-latin that takes in a string and converts it to “Pig Latin”:
for each word, if it starts with a vowel, add “way” at the end of the word, and if
it starts with a consonant, move that consonant to the end of the word and add “ay”.
You may assume that the input string has no upper-case letters, numbers, or punctuation.

For example,
(check-expect (pig-latin "hi boys and girls")
"ihay oysbay andway irlsgay")|#

;; pig-latin: String -> String
;; Given a string, converts it to "Pig Latin"
;; - if it starts with a vowel, add “way” at the end of the word
;; - it starts with a consonant, move that consonant to the end of the word and add “ay”
(check-expect (pig-latin "hi boys and girls")
              "ihay oysbay andway irlsgay")

(define (pig-latin s)
  (cond
    [(zero? (string-length s)) ""]
    [else
     (cond
       [(starts-with-consonant? (extract-word s))
        (string-append
         (add-ay (extract-word s))
         (pig-latin (substring s (string-length (extract-word s)))))]
       [(starts-with-vowel? (extract-word s))
        (string-append
         (add-way (extract-word s))
         (pig-latin (substring s (string-length (extract-word s)))))]
       [else
        (string-append
         " "
         (pig-latin (substring s 1)))])]))

;; extract-word : String -> String
;; Given a string, extrat substring to the first space
(check-expect (extract-word "this is a line.") "this")
(check-expect (extract-word "") "")

(define (extract-word s)
  (cond
    [(or (zero? (string-length s))
         (not (string-alphabetic? (string-ith s 0)))) ""]
    [else
     (string-append
      (string-ith s 0)
      (extract-word (substring s 1)))]))

;; add-ay : String -> String
;; Given a String, add starting consonant to the end and add "ay" to the start
(check-expect (add-ay "stone") "tonesay")

(define (add-ay s)
  (string-append 
   (substring s 1 (string-length s))
   (string-ith s 0)
   "ay"))

;; add-way : String -> String
;; Given a String, add "way" at the end of the string
(check-expect (add-way "asteroid") "asteroidway")

(define (add-way s)
  (string-append s "way"))

;; vowel? : 1String -> Boolean
;; Given a string (length of one), produces true if it is a vowel.
(check-expect (vowel? "a") true)
(check-expect (vowel? "r") false)

(define (vowel? s)
  (or (equal? s "a")
      (equal? s "e")
      (equal? s "i")
      (equal? s "o")
      (equal? s "u")
      (equal? s "y")
      (equal? s "ä")
      (equal? s "ö")))

;; starts-with-vowel? : String -> Boolean
;; Given a string (length of one), produces true if it starts with a vowel
(check-expect (starts-with-vowel? "abc") true)
(check-expect (starts-with-vowel? "bcd") false)
(check-expect (starts-with-vowel? "") false)

(define (starts-with-vowel? s)
  (and
   (> (string-length s) 0)
   (string-alphabetic? (string-ith s 0))
   (vowel? (string-ith s 0))))

;; starts-with-consonant? : String -> Boolean
;; Given a string, produces true if it starts with a consonant
(check-expect (starts-with-consonant? "abc") false)
(check-expect (starts-with-consonant? "bcd") true)
(check-expect (starts-with-consonant? "") false)

(define (starts-with-consonant? s)
  (and
   (> (string-length s) 0)
   (string-alphabetic? (string-ith s 0))
   (not (vowel? (string-ith s 0)))))