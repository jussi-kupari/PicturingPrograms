;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2131_2138) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.3.1
; Define a structure named my-posn to represent an (x, y) coordinate
; pair. The result should behave just like the built-in posn, except for its name.

(define-struct my-posn (x y))
;; my-posn is (make-my-posn Number Number)
;; interp. a position with x- and y-coordinates

(define POS (make-my-posn 200 300))
POS

; Exercise 21.3.2
; Define a data type to represent a CD in your audio library, including
; such information as the title, performer, what year it was recorded, and how many
; tracks it has.

(define-struct cd (title performer year tracks))
;; Cd is (make-cd (String String Natural Natural)
;; interp. a representation of a CD-record

(define CD (make-cd "Purple Rain" "Prince" 1984 8))
CD

; Exercise 21.3.3
; Define a data type to represent a candidate in an election. There should
; be two fields: the candidate’s name and how many votes (s)he got.

(define-struct candidate (name votes))
;; Candidate is (make-candidate String Natural)
;; interp. a candidate in an election

(define CAND (make-candidate "John Norris" 4700))
CAND

; Exercise 21.3.4
; Define a data type to represent a course at your school, including the
; name of the course, the name of the instructor, what room it meets in, and what time it
; meets. (For now, assume all courses start on the hour, so you only need to know what
; hour the course starts.)
; 
; Hint: You’ll need to decide whether a “room” is best represented as a number or a
; string.


(define-struct course (name instructor room time))
;; Course is (make-course String String String Natural)
;; interp. a course at my school

(define COURSE (make-course "Stats101" "Hadley" "A489" 14))
COURSE

; Exercise 21.3.5
; Define a data type to represent a basketball player, including the player’s
; name, what team (s)he plays for, and his/her jersey number.

(define-struct player (name team number))
;; Player is (make-player String String Natural)
;; interp. a basketball player

(define PLAYER (make-player "Jack Roo" "Pelicans" 17))
PLAYER

; Exercise 21.3.6
; Define a data type to represent a dog (or a cat if you prefer), with a
; name, age, weight, and color.

(define-struct dog (name age weight color))
;; Dog is (make-dog String Natural Number String)
;; interp. a dog

(define DOG (make-dog "Mr. Sniffles" 7 10.7 "black"))

; Exercise 21.3.7
; Define a data type to represent a mathematical rectangle, whose prop-
; erties are length and width.
; 
; Hint: There’s already a function named rectangle, so if you try to write
; (define-struct rectangle ...)
; you’ll probably get an error message. Name your struct rect instead.
; 
; Hint: This data type has nothing to do with images. A rect has no color, it is not
; outlined or solid, it has no position, etc.; it has only a length and a width.

(define-struct rektangle (length width))
;; Rektangle is (make-rektangle Natural Natural)
;; interp. a mathematical rectangle

(define REKT (make-rektangle 20 40))
REKT

; Exercise 21.3.8
; Define a data type to represent a time of day, in hours, minutes, and
; seconds. (Assume a 24-hour clock, so 3:52:14 PM would have hours=15, minutes=52,
; seconds=14.)

(define-struct time (hour minute second))
;; Time is (make-time Natural[0, 23] Natural[0, 59] Natural[0, 59])
;; interp. Time as hour:minute:second

(define TIME (make-time 23 52 14))
TIME

