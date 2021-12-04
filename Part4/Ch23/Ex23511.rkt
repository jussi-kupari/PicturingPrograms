;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex23511) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 23.5.11
Design a function mad-lib similar to the above, but it takes a string
(the template) and three non-empty lists (which we’ll call nouns, verbs, and adjectives).
The template may contain the “special” words
-noun-
-verb-
-adjective-

Each -noun- should be replaced by a randomly chosen element of nouns, and so on.
For
example,
(mad-lib
"The -noun- -verb- the -adjective- -noun- and -verb- quickly."
(list "dog" "cat" "senator" "taxi" "train" "chair")
(list "tall" "green" "expensive" "chocolate" "overrated")
(list "ate" "drank" "slept" "wrote"))
; could be
"The senator slept the overrated cat and drank quickly."|#


;; -- Data Definitions

;; NELOS (Non-Empty-List-Of-Strings) is on of:
;; - (cons String empty)
;; - (cons String NELOS)
;; - interp. a non-empty list of strings


;; -- Functions

;; mad-lib : String NELOS NELOS NELOS -> String
;; Given a string and three NELOS, produces a string as a quasi-random combination of the inputs.

(define (mad-lib s nouns adjectives verbs)
  (cond
    [(zero? (string-length s)) ""]
    [else
     (cond
       [(starting-noun? s)
        (string-append (random-word nouns)
                       (mad-lib (substring s 6) nouns adjectives verbs))]
       [(starting-verb? s)
        (string-append (random-word verbs)
                       (mad-lib (substring s 6) nouns adjectives verbs))]
       [(starting-adjective? s)
        (string-append (random-word adjectives)
                       (mad-lib (substring s 11) nouns adjectives verbs))]
       [else
        (string-append (string-ith s 0)
                       (mad-lib (substring s 1) nouns adjectives verbs))])]))

;; starting-noun? : String -> Boolean
;; Given a string, produces true if it is a starting signal for a noun ("-noun-")
(check-expect (starting-noun? "-verb-") false)
(check-expect (starting-noun? "verb") false)
(check-expect (starting-noun? "-noun-") true)
(define (starting-noun? s)
  (and (string=? (string-ith s 0) "-")
       (string=? (string-ith s 1) "n")
       (string=? (string-ith s 2) "o")))

;; starting-verb? : String -> Boolean
;; Given a string, produces true if it is a starting signal for a verb ("-verb-")
(check-expect (starting-verb? "-verb-") true)
(check-expect (starting-verb? "verb") false)
(check-expect (starting-verb? "-noun-") false)

(define (starting-verb? s)
  (and (string=? (string-ith s 0) "-")
       (string=? (string-ith s 1) "v")
       (string=? (string-ith s 2) "e")))

;; starting-adjective? : String -> Boolean
;; Given a string, produces true if it is a starting signal for an adjective ("-adjective-")
(check-expect (starting-adjective? "-verb-") false)
(check-expect (starting-adjective? "verb") false)
(check-expect (starting-adjective? "-adjective-") true)

(define (starting-adjective? s)
  (and (string=? (string-ith s 0) "-")
       (string=? (string-ith s 1) "a")
       (string=? (string-ith s 2) "d")))



;; random-word : NELOS -> String
(check-member-of
 (random-word (cons "a" (cons "b" (cons "c" empty))))
 "a" "b" "c")
(define (random-word nelos)
  (list-ref nelos (random (length nelos))))
 