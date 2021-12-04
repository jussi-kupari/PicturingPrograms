;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2358) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.8
Modify your solution to exercise 23.5.7 so that if a word starts with more than one
consonant, the function moves all of them to the end, followed by “ay”.

For example,
(check-expect (pig-latin "this is a strange function")
"isthay isway away angestray unctionfay")|#

;; pig-latin: String -> String
;; Given a string, converts it to "Pig Latin"
;; - if it starts with vowel, add “way” at the end of the word
;; - it starts with consonant(s), move all consonants to the end of the word and add “ay” at the end
(check-expect (pig-latin "hi boys and girls")
              "ihay oysbay andway irlsgay")
(check-expect (pig-latin "this is a strange function")
              "isthay isway away angestray unctionfay")

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