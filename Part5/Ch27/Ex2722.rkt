;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2722_wip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.2.2
What other functions have you written that would benefit from this
technique? Try rewriting them and see whether they’re shorter and clearer.|#

#|Exercise 25.4.12
Develop a function substring? that takes in two strings and tells
whether the first one appears in the second as a substring. |#

;; -- Functions

; == found.v3? using local definitions ==

;; found.v3? : String String -> Boolean
;; Given two strings, produces true if the first is found at the start of the second.
(check-expect (found.v3? "abc" "") false)
(check-expect (found.v3? "abc" "ab") false)
(check-expect (found.v3? "abc" "bcde") false)
(check-expect (found.v3? "abc" "abc") true)
(check-expect (found.v3? "abc" "abcdef") true)

(define (found.v3? s1 s2)
  (local [(define list-s1 (string->list s1))
          (define list-s2 (string->list s2))]
   (cond
    [(< (length list-s2) (length list-s1)) false]
    [(zero? (length list-s1)) true]
    [else
     (if (char=? (first list-s1) (first list-s2))
         (found.v3? (list->string (rest list-s1))
                    (list->string (rest list-s2)))
         false)])))

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