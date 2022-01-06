;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25412) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.12
Develop a function substring? that takes in two strings and tells
whether the first one appears in the second as a substring. For example,
(check-expect (substring? "bob" "") false)
(check-expect (substring? "" "bob") true)
(check-expect (substring? "b" "bob") true)
(check-expect (substring? "c" "bob") false)
(check-expect (substring? "bob" "bob") true)
(check-expect (substring? "bob" "bobs") true)
(check-expect (substring? "bob" "brats and snobs") false)
(check-expect (substring? "no rat" "brats and snobs") false)
(check-expect (substring? "bob" "thingbobs") true)
(check-expect (substring? "bob" "I botched it but bob fixed it")
true)
(check-expect (substring? "bob" "I botched it but amy fixed it")
false)
(There is a function in some dialects of Racket that does this job, but I want you to
do it using only char=?, comparing one character at a time.)|#

;; -- Functions

; == substring method ==

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

; == string->list method ==

;; substring.v2? : String String -> Boolean
;; Given two strings, produces true if the first is a substring of the second.
(check-expect (substring.v2? "abc" "") false)
(check-expect (substring.v2? "abc" "ab") false)
(check-expect (substring.v2? "abc" "bcde") false)
(check-expect (substring.v2? "abc" "abc") true)
(check-expect (substring.v2? "abc" "abcdef") true)
(check-expect (substring.v2? "abc" "fghabdef") false)
(check-expect (substring.v2? "abc" "jsghfsdajpqwieudflkjwecghasdflöaerkhabcuyerw") true)
(check-expect (substring.v2? "bob" "") false)
(check-expect (substring.v2? "" "bob") true)
(check-expect (substring.v2? "b" "bob") true)
(check-expect (substring.v2? "c" "bob") false)
(check-expect (substring.v2? "bob" "bob") true)
(check-expect (substring.v2? "bob" "bobs") true)
(check-expect (substring.v2? "bob" "brats and snobs") false)
(check-expect (substring.v2? "no rat" "brats and snobs") false)
(check-expect (substring.v2? "bob" "thingbobs") true)
(check-expect (substring.v2? "bob" "I botched it but bob fixed it") true)
(check-expect (substring.v2? "bob" "I botched it but amy fixed it") false)

(define (substring.v2? s1 s2)
  (cond
    [(< (length (string->list s2)) (length (string->list s1))) false]
    [else
     (if (found.v2? s1 s2)
         true
         (substring.v2? s1 (list->string(rest (string->list s2)))))]))

;; found.v2? : String String -> Boolean
;; Given two strings, produces true if the first is found at the start of the second.
(check-expect (found.v2? "abc" "") false)
(check-expect (found.v2? "abc" "ab") false)
(check-expect (found.v2? "abc" "bcde") false)
(check-expect (found.v2? "abc" "abc") true)
(check-expect (found.v2? "abc" "abcdef") true)

(define (found.v2? s1 s2)
  (cond
    [(< (length (string->list s2)) (length (string->list s1))) false]
    [(zero? (length (string->list s1))) true]
    [else
     (if (char=? (first (string->list s1)) (first (string->list s2)))
         (found.v2? (list->string (rest (string->list s1)))
                    (list->string(rest (string->list s2))))
         false)]))