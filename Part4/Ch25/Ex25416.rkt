;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25416_WOP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.16
A common task in computer science is pattern-matching: given a
pattern, ask whether a particular string matches it. In our pattern language, a "?" stands
for “any single character,” while "*" stands for “any zero or more characters.” For
example, the pattern "c?t" would match “cat” and “cut” but not “colt”, “cats”, or “dog”.
Similarly, the pattern "cat*" would match the strings “cat”, “cats”, “catastrophe”, etc.
but not “caltrop” or “dog”. The pattern "a??a*r" would match “abbatoir”, “akbar”, and
“araaar”, etc. but not “almoner”, “alakazam”, or “fnord”. The pattern "*.docx" would
match the name of any Word 2007 file (and thus could be used to decide which filenames
to show in a file dialog).

Define a function pattern-match? that takes in two strings: the pattern and the
target, and tells whether the target matches the pattern.
Note that the special characters "?" and "*" are special only when they appear in the
pattern; if they appear in the target, they should be treated as ordinary characters.|#

;; pattern-match? : String String -> Boolean
;; Given two strings, produces true if the second matches the first using regexp
(check-expect (pattern-match? "c?t" "cat") true)
(check-expect (pattern-match? "*c?t" "cat") true)
(check-expect (pattern-match? "c?t" "cut") true)
(check-expect (pattern-match? "c?t" "caat") false)
(check-expect (pattern-match? "c?t" "colt") false)
(check-expect (pattern-match? "c??t" "colt") true)
(check-expect (pattern-match? "c?t" "dog") false)
(check-expect (pattern-match? "cat*" "cat") true)
(check-expect (pattern-match? "cat*" "cats") true)
(check-expect (pattern-match? "cat*" "catastrophe") true)
(check-expect (pattern-match? "cat*" "caltrop") false)
(check-expect (pattern-match? "cat*" "dog") false)
(check-expect (pattern-match? "a??a*r" "abbatoir") true)
(check-expect (pattern-match? "a??a*r" "akbar") true)
(check-expect (pattern-match? "a??a*r" "araaar") true)
(check-expect (pattern-match? "a??a*r" "almoner") false)
(check-expect (pattern-match? "a??a*r" "alakazam") false)
(check-expect (pattern-match? "a??a*r" "fnord") false)
(check-expect (pattern-match? "c?t*" "cats") true)
(check-expect (pattern-match? "c?t*" "catastrophe") true)
(check-expect (pattern-match? "c?t*" "caltrop") false)
(check-expect (pattern-match? "c?t*" "dog") false)
(check-expect (pattern-match? "*.docx" "thesis-last-version.docx") true)
(check-expect (pattern-match? "*.docx" "thesis-final-final-version.docx") true)

(define (pattern-match? p t)
  (cond
    [(or (both-empty-strings? p t)
         (pattern-only-star? p)) true]
    [(equal-or-questionmark? p t)
     (pattern-match? (substring p 1) (substring t 1))]
    [(string=? (string-ith p 0) "*")
     (pattern-match?
      (substring p 1)
      (skip-to-next-match (string-ith (substring p 1) 0) t))]
    [else false]))

;; skip-to-next-match : String1 String -> String
;; Given a String1 and a string, produces a substring of the second starting from the first match
(check-expect (skip-to-next-match "d" "abcbadef") "def")

(define (skip-to-next-match s1 s2)
  (cond
    [(equal? s1 (string-ith s2 0)) (substring s2 0)]
    [else (skip-to-next-match s1 (substring s2 1))]))

;; both-empty-strings? : String String -> Boolean
;; Given two strings, produces true if both are length zero
(check-expect (both-empty-strings? "" " ") false)
(check-expect (both-empty-strings? "" "") true)

(define (both-empty-strings? s1 s2)
  (and (zero? (string-length s1)) (zero? (string-length s2))))

;; pattern-only-star? : String -> Boolean
;; Given a string, produces true if it is a 1String an a asterisk
(check-expect (pattern-only-star? "a") false)
(check-expect (pattern-only-star? "*") true)

(define (pattern-only-star? s)
  (and (string=? (string-ith s 0) "*") (= (string-length s) 1)))

;; equal-or-questionmark? : String String -> Boolean
;; Given two Strings, produces true if the first chars match or first starts with a questionmark
(check-expect (equal-or-questionmark? "abc" "bcc") false)
(check-expect (equal-or-questionmark? "abc" "adf") true)
(check-expect (equal-or-questionmark? "?bc" "abb") true)

(define (equal-or-questionmark? s1 s2)
  (or (string=? (string-ith s1 0) "?")
      (equal? (string-ith s1 0) (string-ith s2 0))))