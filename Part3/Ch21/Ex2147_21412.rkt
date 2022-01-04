;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2147_21412) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.4.7
; Develop a function full-name that takes in a person struct and returns
; a single string containing the person’s first and last names, separated by a space.

(define-struct person (first last age))
;; Person is (make-person String String Natural)
;; interp. a persons information

;; full-name : Person -> String
;; Given a person, produces the full name as a string
(check-expect (full-name (make-person "james" "brown" 88)) "james brown")

(define (full-name p)
  (string-append (person-first p) " " (person-last p)))

; Exercise 21.4.8
; Develop a function rect-area that takes in a rect struct and returns
; the area of the rectangle (i.e. length times width).

(define-struct rektangle (length width))
;; Rektangle is (make-rektangle Natural Natural)
;; interp. a mathematical rectangle

;; rect-area : Rektangle -> Number
;; Given a rectangle, produces the area
(check-expect (rect-area (make-rektangle 10 10)) 100)
(check-expect (rect-area (make-rektangle 70 10)) 700)
(check-expect (rect-area (make-rektangle 0 10)) 0)

(define (rect-area r)
  (* (rektangle-length r) (rektangle-width r)))

; Exercise 21.4.9
; Develop a function larger-rect? that takes in two rect structs and
; tells whether the first has a larger area than the second.
; Hint: Copying the input template for the rect structure will take care of one of the
; two parameters; for the other, you’ll need to copy the inventory again and change the
; parameter name.

;; larger-rect? : Rektangle Rektangle -> Boolean
;; Given two rectangles, produces true if the first is larger
(check-expect (larger-rect? (make-rektangle 10 10) (make-rektangle 10 10)) false)
(check-expect (larger-rect? (make-rektangle 10 10) (make-rektangle 8 8)) true)
(check-expect (larger-rect? (make-rektangle 5 5) (make-rektangle 10 10)) false)

(define (larger-rect? r1 r2)
  (> (rect-area r1) (rect-area r2)))

; Exercise 21.4.10
; Develop a function seconds-since-midnight that takes in a time-
; of-day struct and returns how many seconds it has been since midnight.

(define-struct time (hour minute second))
;; Time is (make-time Natural[0, 23] Natural[0, 59] Natural[0, 59])
;; interp. Time as hour:minute:second

;; seconds-since-midnight : Time -> Natural
;; Given time of day, produces the number of seconds since midnight
(check-expect (seconds-since-midnight (make-time 0 0 1)) 1)
(check-expect (seconds-since-midnight (make-time 1 0 1)) 3601)
(check-expect (seconds-since-midnight (make-time 1 1 1)) 3661)

(define (seconds-since-midnight t)
  (+ (* (time-hour t) 60 60)
     (* (time-minute t) 60)
     (time-second t)))

; Exercise 21.4.11
; Develop a function seconds-between that takes in two time-of-day
; structs and returns the difference between them, in seconds.
; Hint: For example, the time 11:01:14 is 124 seconds after the time 10:59:10.

;; seconds-between : Time Time -> Natural
;; Given two times, produces the time passed (t1->t2) in seconds

(check-expect (seconds-between (make-time 0 0 1) (make-time 0 0 1)) 0)
(check-expect (seconds-between (make-time 0 0 1) (make-time 0 0 30)) 29)
(check-expect (seconds-between (make-time 0 1 0) (make-time 0 2 0)) 60)
(check-expect (seconds-between (make-time 1 1 0) (make-time 2 1 0)) 3600)

(define (seconds-between t1 t2)
  (- (seconds-since-midnight t2)
     (seconds-since-midnight t1)))

; Exercise 21.4.12
; Develop a function named who-won that takes in three candidate struc-
; tures (from Exercise 21.3.3) and returns the name of the one with the most votes,
; or the word “tie” if two or more of them tied for first place.
; Hint: Obviously, this resembles Exercise 15.5.4, but it doesn’t assume
; that the candidates’ names are always “Anne”, “Bob”, and “Charlie”; it’ll work
; with any names.

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

;; who-won : Candidate Candidate Candidate -> String
;; Given three candidates
;; produces the name of the candidate with the most votes (or "tie")

(check-expect (who-won (make-candidate "jack" 5)
                       (make-candidate "joe" 10)
                       (make-candidate "jill" 13)) "jill")
(check-expect (who-won (make-candidate "jack" 5)
                       (make-candidate "joe" 5)
                       (make-candidate "jill" 13)) "jill")
(check-expect (who-won (make-candidate "jack" 5)
                       (make-candidate "joe" 10)
                       (make-candidate "jill" 10)) "tie")

(define (who-won c1 c2 c3)
  (cond[(and (> (candidate-votes c1) (candidate-votes c2))
             (> (candidate-votes c1) (candidate-votes c3)))
        (candidate-name c1)]
       [(and (> (candidate-votes c2) (candidate-votes c1))
             (> (candidate-votes c2) (candidate-votes c3)))
        (candidate-name c2)]
       [(and (> (candidate-votes c3) (candidate-votes c1))
             (> (candidate-votes c3) (candidate-votes c2)))
        (candidate-name c3)]
       [else "tie"]))