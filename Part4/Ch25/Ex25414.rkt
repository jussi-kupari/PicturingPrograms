;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex25414) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 25.4.14 Develop a function lcsubstring (“longest common substring”) that
takes in two strings and returns the longest string which is a substring of both of them.
For example,
(check-expect (lcsubstring "mickey mouse" "minnie mouser") " mouse")
The answer may not be unique: for example,
(lcsubstring "mickey mouse" "minnie mush")
could legitimately be either "mi", " m", or "us".

Hint: Different approaches to this can differ radically in efficiency.
My first attempt took several minutes to solve the
(lcsubstring "mickey mouse" "minnie mush") problem.
A different approach, using only things that you’ve seen already, solved the same problem
in 0.01 seconds; the difference is even more dramatic for longer strings.

Note: This is my first take on this and could be quite an overcomplicated solution;
however, it is decently fast:
(time (lcsubstring "mickey mouse" "minnie mush"))
==> cpu time: 0 real time: 0 gc time: 0 "mi"

; Random snippet from HackerNews
(time (lcsubstring
"The commenters here seem to take for granted that this cookie law is a good thing and Google/Facebook are evil villains, but there is a difference between a law and a good/just/reasonable law. I would argue interrupting the experience and wasting billions of peoples time clicking on cookie banners is also a form of harm. That’s certainly been my perception as an end user under this policy. I don’t work in ad tech and have no financial stake in this, I’m just sick to death of these fucking cookie popups."

"I would argue that when it comes to developing software, usually the one with the most leverage is the worker who develops it. If she says no, then it doesn't get developed. Maybe in team environments it's a bit trickier when you're looking at a feature as a whole, but each individual has full leverage over the code they produce. That they don't have leverage over the decision-making process seems like a cop out."))

cpu time: 37859 real time: 38647 gc time: 5312
"I would argue "
|#

;; lcsubstring : String String -> String
;; Given two strings, produces the longest common substring
(check-expect (lcsubstring "mickey mouse" "minnie mouser") " mouse")
(check-expect (lcsubstring "mickey mouse" "minnie mush") "mi") ;first of many given

(define (lcsubstring s1 s2)
  (cond
    [(or (empty? s1) (empty? s2)) ""]
    [else
     (get-longest-string
      (get-list-of-common-substrings
       (get-full-substrings s1) s2))]))

;; get-list-of-common-substrings : LOS String -> LOS
;; Given a LOS and a string, produces a list of all common substrings found
(check-expect
 (get-list-of-common-substrings empty "fgsdfabchd")
 empty)
(check-expect
 (get-list-of-common-substrings (list "fg" "abcd" "sdfab" "xhd") "")
 empty)
(check-expect
 (get-list-of-common-substrings (list "fg" "abcd" "sdfab" "xhd") "fgsdfabchd")
 (list "fg" "sdfab"))

(define (get-list-of-common-substrings los s)
  (cond
    [(or (empty? los) (zero? (string-length s))) empty]
    [else (if (substring? (first los) s)
              (cons (first los) (get-list-of-common-substrings (rest los) s))
              (get-list-of-common-substrings (rest los) s))]))

;; get-longest-string : LOS -> String
;; Given a LOS, produces the longest string in the list
(check-expect (get-longest-string empty) "")
(check-expect (get-longest-string (list "a" "ab" "abc")) "abc")
(check-expect (get-longest-string (list "a" "abcdef" "abc")) "abcdef")

(define (get-longest-string los)
  (cond
    [(empty? los) ""]
    [else
     (get-longest-of-two (first los) (get-longest-string (rest los)))]))

;; get-longest-of-two : String String -> String
;; Given two strings, produces the one that is longer (in a tie, produce first)
(check-expect (get-longest-of-two "" "") "")
(check-expect (get-longest-of-two "abc" "def") "abc")
(check-expect (get-longest-of-two "abcd" "def") "abcd")
(check-expect (get-longest-of-two "abcd" "defgh") "defgh")

(define (get-longest-of-two s1 s2)
  (if (>= (string-length s1) (string-length s2))
      s1 s2))

;; get-full-substrings : String -> LOS
;; Given a string, produces a complete list of substrings
(check-expect (get-full-substrings "") empty)
(check-expect (get-full-substrings "abc") (list "abc" "ab" "a" "bc" "b" "c"))

(define (get-full-substrings s)
  (cond
    [(zero? (string-length s)) empty]
    [else (append (get-substrings s (string-length s))
                  (get-full-substrings (substring s 1)))]))

;; get-substrings : String Natural -> LOS
;; Given string and natural,
;; produces a list of substrings (LOS) from the first letter to each other letter
(check-expect (get-substrings "jussi" 0) empty)
(check-expect (get-substrings "jussi" 10) empty)
(check-expect (get-substrings "jussi" 2) (list "ju" "j"))
(check-expect (get-substrings "jussi" 5) (list "jussi" "juss" "jus" "ju" "j"))

(define (get-substrings s n)
  (cond
    [(> n (string-length s)) empty]
    [(zero? n) empty]
    [else (cons (substring s 0 n)
                (get-substrings s (sub1 n)))]))

;; substring? : String String -> Boolean
;; Given two strings, produces true if the first is a substring of the second.
(check-expect (substring? "abc" "") false)
(check-expect (substring? "abc" "ab") false)
(check-expect (substring? "abc" "bcde") false)
(check-expect (substring? "abc" "abc") true)
(check-expect (substring? "abc" "abcdef") true)
(check-expect (substring? "abc" "fghabdef") false)
(check-expect (substring? "abc" "jsghfsdajpqwieudflkjwecghasdflöaerkhabcuyerw") true)
(check-expect (substring? "bob" "") false)
(check-expect (substring? "" "bob") true)
(check-expect (substring? "b" "bob") true)
(check-expect (substring? "c" "bob") false)
(check-expect (substring? "bob" "bob") true)
(check-expect (substring? "bob" "bobs") true)
(check-expect (substring? "bob" "brats and snobs") false)
(check-expect (substring? "no rat" "brats and snobs") false)
(check-expect (substring? "bob" "thingbobs") true)
(check-expect (substring? "bob" "I botched it but bob fixed it") true)
(check-expect (substring? "bob" "I botched it but amy fixed it") false)

(define (substring? s1 s2)
  (cond
    [(< (string-length s2) (string-length s1)) false]
    [else
     (if (found? s1 s2)
         true
         (substring? s1 (substring s2 1)))]))

;; found? : String String -> Boolean
;; Given two strings, produces true if the first is found at the start of the second.
(check-expect (found? "abc" "") false)
(check-expect (found? "abc" "ab") false)
(check-expect (found? "abc" "bcde") false)
(check-expect (found? "abc" "abc") true)
(check-expect (found? "abc" "abcdef") true)

(define (found? s1 s2)
  (cond
    [(< (string-length s2) (string-length s1)) false]
    [(zero? (string-length s1)) true]
    [else
     (if (equal? (substring s1 0 1) (substring s2 0 1))
         (found? (substring s1 1) (substring s2 1))
         false)]))