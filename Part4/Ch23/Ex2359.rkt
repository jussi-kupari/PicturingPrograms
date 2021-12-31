;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2359) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.9
Modify your solution to exercise 23.5.7 or 23.5.8 to handle capital letters correctly:
any word that started with a capital letter before should still start with a capital
letter after converting it to Pig Latin, and capital letters moved from the start
to the end of a word should no longer be capitalized.
For example, if you made both this modification and the one in exercise 23.5.8,

(check-expect (pig-latin "My name is Stephen Bloch")
"Ymay amenay isway Ephenstay Ochblay")

Hint: To do this, you may need some of the built-in functions char-upper-case?,
char-lower-case?, char-upcase, and char-downcase. Look them up in the Help Desk.|#

;; pig-latin: String -> String
;; Given a string, converts it to "Pig Latin"
;; - if it starts with vowel, add “way” at the end of the word
;; - it starts with consonant(s), move all consonants to the end of the word and add
;; “ay” at the end
;; - if the word starts with a capital letter, is should still start with a capital letter
(check-expect (pig-latin "Hi Boys and Girls")
              "Ihay Oysbay andway Irlsgay")
(check-expect (pig-latin "This is a Strange Function")
              "Isthay isway away Angestray Unctionfay")

(define (pig-latin s)
  (cond
    [(zero? (string-length s)) ""]
    [else
     (cond
       [(and (starts-with-consonant? (extract-word s))
             (starts-with-capital? (extract-word s)))
        (string-append
         (capitalize-word (add-ay (decapitalize-word (extract-word s))))
         (pig-latin (substring s (string-length (extract-word s)))))]
       [(starts-with-consonant? (extract-word s))
        (string-append
         (add-ay (extract-word s))
         (pig-latin (substring s (string-length (extract-word s)))))]
       [(and (starts-with-vowel? (extract-word s))
             (starts-with-capital? (extract-word s)))
        (string-append
         (capitalize-word (add-way (decapitalize-word (extract-word s))))
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
;; Given a string, extract substring to the first space
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
;; Given a String, place all starting consonants to the end and add "ay" to the end
(check-expect (add-ay "abcd") "abcd")
(check-expect (add-ay "bcde") "ebcday")

(define (add-ay s)
  (if (starts-with-consonant? s)
      (string-append
       (substring s (count-consecutive-consonants s))
       (substring s 0 (count-consecutive-consonants s))
       "ay")
      s))

;; count-consecutive-consonants : String -> Natural
;; Given a string, produces the number of consecutive consonants from the start
(check-expect (count-consecutive-consonants "abc") 0)
(check-expect (count-consecutive-consonants "bcde") 3)

(define (count-consecutive-consonants s)
  (cond
    [(vowel? (string-ith s 0)) 0]
    [else (add1 (count-consecutive-consonants (substring s 1)))]))

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

;; capitalize-word : String -> String
;; Given a string, produces it with an upper-case first letter
(check-expect (capitalize-word "john") "John")

(define (capitalize-word s)
  (string-append
   (string-upcase (string-ith s 0))
   (substring s 1)))

;; decapitalize-word : String -> String
;; Given a string, produces it with a lower-case first letter
(check-expect (decapitalize-word "John") "john")

(define (decapitalize-word s)
  (string-append
   (string-downcase (string-ith s 0))
   (substring s 1)))

;; starts-with-capital? : String -> Boolean
;; Given a string, produces true if the string starts with a capital letter
(check-expect (starts-with-capital? "john") false)
(check-expect (starts-with-capital? "John") true)

(define (starts-with-capital? s)
  (string-upper-case?
   (string-ith s 0)))