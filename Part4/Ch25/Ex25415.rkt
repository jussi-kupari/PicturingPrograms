;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25415_WOP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.15
Develop a function lcsubsequence (“longest common subsequence”) that takes in
two strings and returns the longest string which is a subsequence of both of
them. For example,
(check-expect (lcsubsequence "mickey mouse" "minnie moose")
"mie mose")

The answer may not be unique: for example, (lcsubsequence "abc" "cba") could
legitimately be any of the strings "a", "b", or "c".

Hint: As in exercise 25.4.14, your program may be slow. My first attempt took about
2.5 seconds to solve (lcsubsequence "mickey mouse" "minnie moose"), and I don’t
know of a more efficient way to do it using what you’ve already seen. A technique called
dynamic programming or memoization, which we’ll discuss in Chapter 30, enabled me to
do it in about 0.01 seconds.Again, the difference is more dramatic for longer strings.
|#

#|
The key is to come up with a function that creates a list of all the subsequences of a given string.
|#

;; -- Data Definitions

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)

;; List-of-LOS (LOLOS) is one of:
;; - empty
;; - (cons LOS LOLOS)

;; -- Functions

;; lcsubsequence : String String -> String
;; Given two strings, produces the longes string that is a subsequence of both
(check-expect (lcsubsequence "mickey mouse" "minnie moose") "mie mose")

(define (lcsubsequence s1 s2)
  (longest-string
   (intersection
    (substrings (subsets (string->los s1)))
    (substrings (subsets (string->los s2))))))

;; longest-string : LOS -> String
;; Given a LOS, produces the longest string in the list
(check-expect (longest-string empty) "")
(check-expect (longest-string (list "a" "ab" "abc")) "abc")

(define (longest-string los)
  (cond
    [(empty? los) ""]
    [else
     (longest-of-two (first los) (longest-string (rest los)))]))

;; longest-of-two : String String -> String
;; Given two strings, produces the longer one
(check-expect (longest-of-two "ab" "ac") "ab")
(check-expect (longest-of-two "abc" "ac") "abc")
(check-expect (longest-of-two "abc" "acde") "acde")

(define (longest-of-two s1 s2)
  (if (>= (string-length s1) (string-length s2))
      s1 s2))

;; substrings : LOLOS -> LOS
;; Given a LOLOS, produces a LOS that represents all the substrings made from the String
(check-expect (substrings empty) empty)
(check-expect (substrings (list
                           (list "a" "b" "c")
                           (list "b" "c")
                           (list "a" "c")
                           (list "c")
                           (list "a" "b")
                           (list "b")
                           (list "a")
                           empty))  (list "abc" "bc" "ac" "c" "ab" "b" "a" ""))

(define (substrings lolos)
  (cond
    [(empty? lolos) empty]
    [else (cons (collapse (first lolos))
                (substrings (rest lolos)))]))

;; collapse : LOS -> String
;; Given a LOS, produces a String by collapsing the individual strings
(check-expect (collapse empty) "")
(check-expect (collapse (list "a" "b" "c")) "abc")

(define (collapse los)
  (cond
    [(empty? los) ""]
    [else
     (string-append (first los) (collapse (rest los)))]))

;; subsets : LOS -> LOLOS
;; Given a LOS, produces all possible subsets of the LOS
(check-expect (subsets empty)
              (list empty))
(check-expect (subsets (list "a" "b" "c"))
              (list
               (list "a" "b" "c")
               (list "b" "c")
               (list "a" "c")
               (list "c")
               (list "a" "b")
               (list "b")
               (list "a")
               empty))

(define (subsets los)
  (cond
    [(empty? los) (list empty)]
    [else (combine (first los)
                   (subsets (rest los)))]))

;; string->los : String -> LOS
;; Given string, produces a list of 1Strings
(check-expect (string->los "") empty)
(check-expect (string->los "abc") (list "a" "b" "c"))

(define (string->los s)
  (cond
    [(zero? (string-length s)) empty]
    [else (cons (string-ith s 0)
                (string->los (substring s 1)))]))

;; combine : String LOLOS -> LOLOS
;; Given a string and a LOLOS, produces a LOLOS with string both added and not-added to each list
(check-expect (combine "a" empty)
              empty)
(check-expect (combine "a" (list (list "b" "c") (list "d" "e")))
              (list (list "a" "b" "c") (list "b" "c") (list "a" "d" "e") (list "d" "e")))

(define (combine s lolos)                
  (cond
    [(empty? lolos)  empty]                    ; for empty lolos return empty            
    [else
     (cons (cons s (first lolos))              ; Both add s and  
           (cons (first lolos)                 ; don't add, to first subset in lolos    
                 (combine s (rest lolos))))])) ; and do the same with the rest of the lolos

;; intersection : LOS LOS -> LOS
;; Given two lists of strings, produces the intersection of the lists
(check-expect
 (intersection empty empty)
 empty)
(check-expect
 (intersection (cons "a" (cons "b" empty)) empty)
 empty)
(check-expect
 (intersection empty (cons "a" (cons "b" empty)))
 empty)
(check-expect
 (intersection (cons "b" (cons "c" empty)) (cons "a" (cons "b" empty)))
 (cons "b" empty))
(check-expect
 (intersection (cons "b" (cons "c" (cons "d" empty))) (cons "a" (cons "b" (cons "c" empty))))
 (cons "b" (cons "c" empty)))

(define (intersection los1 los2)
  (cond
    [(or (empty? los1) (empty? los1)) empty]
    [(string-in-los? (first los1) los2)
     (cons (first los1) (intersection (rest los1) los2))]
    [else
     (intersection (rest los1) los2)]))

;; string-in-los? : String LOS -> Boolean
;; Given a string and a LOS, produces true if the string is in the LOS
(check-expect (string-in-los? "a" empty) false)
(check-expect (string-in-los? "a" (cons "b" (cons "c" (cons "d" empty)))) false)
(check-expect (string-in-los? "a" (cons "a" (cons "b" (cons "c" empty)))) true)

(define (string-in-los? s los)
  (cond
    [(empty? los) false]
    [else
     (if (equal? s (first los))
         true
         (string-in-los? s (rest los)))]))