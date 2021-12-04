;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1373_13713) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 13.7.3
; Develop a function teenage? that takes in a person’s age and re-
; turns whether the person is at least 13 but younger than 20.


(require picturing-programs)

;; Natural -> Boolean
;; Given a persons age, return true if person is at least 13 but younger than 20
(check-expect (teenage? 17) true)
(check-expect (teenage? 10) false)
(check-expect (teenage? 20) false)
(check-expect (teenage? 13) true)
(check-expect (teenage? 21) false)

(define (teenage? n)
  (and (>= n 13)
       (< n 20)))

; Exercise 13.7.4
; Develop a function negative-or-over-100? that takes in a number
; and returns whether it is either negative (i.e. less than zero) or over 100.


;; Number -> Boolean
;; Given an number, produces true if number is negative OR over 100
(check-expect (negative-or-over-100? 0) false)
(check-expect (negative-or-over-100? 100) false)
(check-expect (negative-or-over-100? -2) true)
(check-expect (negative-or-over-100? 104) true)

(define (negative-or-over-100? n)
  (or (< n 0)
      (> n 100)))

; Exercise 13.7.5
; Develop a function may-drive-but-not-drink? that takes in a
; person’s age and tells whether the person is old enough to
; have a driver’s license (in most of the U.S.) but not old enough
; to drink alcohol (in most of the U.S.).
; 
; Hint: Re-use previously-written functions!


;; Natural -> Boolean
;; Given age, produce true if person is old enogh to drive (16) but not drink (21)
(check-expect (may-drive-but-not-drink? 17) true)
(check-expect (may-drive-but-not-drink? 16) true)
(check-expect (may-drive-but-not-drink? 10) false)
(check-expect (may-drive-but-not-drink? 20) true)
(check-expect (may-drive-but-not-drink? 13) false)
(check-expect (may-drive-but-not-drink? 21) false)

(define (may-drive-but-not-drink? n)
  (and (>= n 16)
       (< n 21)))



; Exercise 13.7.6
; The game of “craps” involves rolling a pair of dice, and (in a simplified
; version of the game) if the result is 7 or 11, you win. Develop a function named
; win-craps? that takes in a number and tells whether it’s either a 7 or an 11.


;; Number -> Boolean
;; Given a number, produces true if it is either 7 or 11
(check-expect (win-craps? 0) false)
(check-expect (win-craps? 10) false)
(check-expect (win-craps? 11) true)
(check-expect (win-craps? 7) true)

(define (win-craps? n)
  (or (= n 7)
      (= n 11)))


; Exercise 13.7.7
; Develop a function named play-craps that takes a dummy argument,
; rolls two dice, adds them up, and returns true or false depending
; on whether you won the roll.
; 
; Hint: Re-use previously defined functions!


;; *dummy* -> Boolean
;; Given a dummy argument, simulates rolling two die, and produces true if sum 7 OR 11

(define (play-craps dummy)
  (win-craps? (sum-of-two-die dummy)))


;; *dummy* -> Natural
;; Simulate rolling two die and produce the sum of scores
(check-range (sum-of-two-die 0) 2 12)
(check-range (sum-of-two-die "xx") 2 12)

(define (sum-of-two-die dummy)
  (+ (+ 1 (random 6))
     (+ 1 (random 6))))


; Exercise 13.7.8
; Develop a function not-13? that takes a number and tells whether
; it’s not exactly 13.


;; Number -> Boolean
;; Given a number, produces true if it is not exactly 13
(check-expect (not-13? 12) true)
(check-expect (not-13? 13) false)
(check-expect (not-13? 12.9999) true)
(check-expect (not-13? 13.000001) true)

(define (not-13? n)
  (not
   (= n 13)))

; Exercise 13.7.9
; Develop a function not-single-letter? that takes a string and
; tells whether its length is anything other than 1.


;; String -> Boolean
;; Given a string, produces true if the length is not 1
(check-expect (not-single-letter? "") true)
(check-expect (not-single-letter? "a") false)
(check-expect (not-single-letter? "asdf") true)
(check-expect (not-single-letter? "lashfdkas") true)
(check-expect (not-single-letter? "1") false)

(define (not-single-letter? s)
  (not
   (= (string-length s) 1)))


; Exercise 13.7.10
; Develop a function over-65-or-teenage? that takes in a person’s
; age and tells whether the person is either over 65 or in his/her teens.


;; Natural -> Boolean
;; Given age, produces true if person is either over 65 or in his/her teens
(check-expect (over-65-or-teenage? 17) true)
(check-expect (over-65-or-teenage? 66) true)
(check-expect (over-65-or-teenage? 65) false)
(check-expect (over-65-or-teenage? 10) false)
(check-expect (over-65-or-teenage? 20) false)
(check-expect (over-65-or-teenage? 0) false)

(define (over-65-or-teenage? n)
  (or (teenage? n)
      (> n 65)))

; Exercise 13.7.11
; Develop a function lose-craps? that takes in a number and tells
; whether it is not either 7 or 11. That is, the result should be
; false for 7 and 11, and true for everything else.


;; Natural -> Boolean
;; Given a number, produces true if it is NOT 7 or 11
(check-expect (lose-craps? 11) false)
(check-expect (lose-craps? 7) false)
(check-expect (lose-craps? 2) true)
(check-expect (lose-craps? 12) true)

(define (lose-craps? n)
  (not
   (or (= n 7)
       (= n 11))))


; Exercise 13.7.12
; Develop a function is-not-red-square? that takes in an image
; and tells whether it is anything other than a solid red square.
; Hint: Use image-width to find out how wide the image is.


;; Image -> Boolean
;; Given an image, produces true if it is anything other than a solid red square
(check-expect (is-not-red-square? (square 50 "solid" "red")) false)
(check-expect (is-not-red-square? (square 12 "solid" "red")) false)
(check-expect (is-not-red-square? (circle 10 "solid" "red")) true)
(check-expect (is-not-red-square? (rectangle 10  30 "outline" "blue")) true)

(define (is-not-red-square? img)
  (not
   (image=? img
            (rectangle (image-width img)
                       (image-width img)
                       "solid" "red"))))


; Exercise 13.7.13
; Develop a function any-two-same-pics? that takes in three images
; and tells whether any two (or more) of them are exactly the same.
; 
; Hint: There are at least three different ways the answer could be true.
; Test them all, as well as at least one case in which the answer should be false.



;; Image Image Image -> Boolean
;; Given three images, produces true if any two are identical
(check-expect
 (any-two-same-pics?
  (circle 10 "solid" "blue")
  (circle 10 "solid" "blue")
  (circle 10 "solid" "blue")) true)

(check-expect
 (any-two-same-pics?
  (circle 10 "solid" "blue")
  (circle 10 "solid" "blue")
  (circle 10 "solid" "red")) true)

(check-expect
 (any-two-same-pics?
  (circle 10 "solid" "blue")
  (circle 10 "solid" "red")
  (circle 10 "solid" "blue")) true)

(check-expect
 (any-two-same-pics?
  (circle 10 "solid" "red")
  (circle 10 "solid" "blue")
  (circle 10 "solid" "blue")) true)

(check-expect
 (any-two-same-pics?
  (circle 10 "solid" "red")
  (circle 10 "solid" "blue")
  (circle 10 "outline" "blue")) false)


(define (any-two-same-pics? a b c)
  (or
   (image=? a b)
   (image=? a c)
   (image=? b c)))
