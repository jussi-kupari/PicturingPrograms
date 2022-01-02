;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2281) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 22.8.1
Write a data definition, including templates, for a nested string list, in which each
element may be either a string or another nested string list.|#

;; -- Data Definition

;; NSL (NestedStringList) is one of:
;; - empty
;; - (cons String NSL)
;; - (cons LOS NSL)

;; LOS is one of:
;; - empty
;; - (cons String LOS)

#|Template for NSL
(define (fn-for-nsl nsl)
  (cond
    [(empty? nsl) (...)]
    [(string? (first nsl))
     (... (first nsl)
          (fn-for-nsl (rest nsl)))]
    [else
     (... (fn-for-nsl (first nsl))
          (fn-for-nsl (rest nsl)))]))|#

#|Exercise 22.8.2
Translate the following English sentences into nested string lists, using a list to
represent each quotation.

• “We watched “Rudolph the Red-Nosed Reindeer” and “Frosty the Snowman” on
Christmas Eve.”

• “ “This is silly,” said Mary.”

• “Grandpa said “I’ll read you a book called “The Princess Bride”, one of my favorites.
“Once upon a time, there was a beautiful princess named Buttercup. The stable-boy,
Wesley, was in love with her, but never said anything but “As you wish.” ” ” The
boy was already asleep.” |#

(cons
 "We"
 (cons
  "watched"
  (cons
   (cons "Rudolph" (cons "the" (cons "Red-Nosed" (cons "Reindeer" empty))))
   (cons
    "and"
    (cons
     (cons "Frosty" (cons "the" (cons "Snowman" empty)))
     (cons
      "on"
      (cons
       "Christmas"
       (cons
        "Eve"
        (cons
         "." empty)))))))))

(cons
 " "
 (cons
  (cons "This" (cons "is" (cons "silly" (cons "," empty))))
  (cons
   "said"
   (cons
    "Mary"
    (cons
     "." empty)))))