;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2355) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.5
Modify your solution to exercise 23.5.4 so it inserts the letters “ubb” only once in front
of each group of consecutive vowels.
For example,
(check-expect (ubby-dubby "hello friends out there")
"hubbellubbo frubbiends ubbout thubberubbe")

Hint: See Exercise 22.7.4.|#

;; ubby-dubby.v2 : String -> String
;; Given a string, produces it with "ubb" placed in front of each set of consecutive vowels.
(check-expect (ubby-dubby.v2 "abc") "ubbabc")
(check-expect (ubby-dubby.v2 "aabcd") "ubbaabcd")
(check-expect (ubby-dubby.v2 "dee") "dubbee")
(check-expect (ubby-dubby.v2 "aabcdeeee") "ubbaabcdubbeeee")

(define (ubby-dubby.v2 s)
  (cond
    [(zero? (string-length s)) ""]
    [else
     (if (= (count-consecutive-vowels s) 0)
         (string-append
          (string-ith s 0) (ubby-dubby.v2 (substring s 1)))
         (string-append
          (string-append "ubb" (substring s 0 (count-consecutive-vowels s)))
          (ubby-dubby.v2 (substring s (count-consecutive-vowels s)))))]))


;; count-consecutive-vowels : String -> Natural
;; Given an string, produces the number of consecutive vowels from the start of the string
(check-expect (count-consecutive-vowels "") 0)
(check-expect (count-consecutive-vowels "bcdeee") 0)
(check-expect (count-consecutive-vowels "abc") 1)
(check-expect (count-consecutive-vowels "abbbc") 1)
(check-expect (count-consecutive-vowels "aaaaabc") 5)

(define (count-consecutive-vowels s)
  (cond
    [(zero? (string-length s)) 0]
    [else
     (if (vowel? (string-ith s 0))
         (+ 1 (count-consecutive-vowels (substring s 1)))
         0)]))


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