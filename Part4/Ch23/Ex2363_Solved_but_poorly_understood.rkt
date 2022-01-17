;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2363_UNSOLVED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 23.6.3 Develop a function subsets that takes in a list (of numbers, strings,
it doesn’t matter) and returns a list of lists representing all possible subsets of the elements
in the original list, once each. For example, (subsets (list "a" "b" "c")) should
produce something like:

(list (list)
(list "a")
(list "b")
(list "a" "b")
(list "c")
(list "a" "c")
(list "b" "c")
(list "a" "b" "c"))
You may assume that all the things in the input list are different.

___

I wasn't able to get to the solution on my own. I just could not figure out the recursive algo.
The author of the book doesn't really give any help with these harder problems.
"Just do it one step at the time"... Sure, that reads just "Now draw the rest of the f*cking owl"
 
Luckily I found the answer here:
https://stackoverflow.com/questions/20622945/how-to-do-a-powerset-in-drracket

I can understand it now, but implementing it on my own was too much without any help.
|#

;; -- Data Definitions

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)

;; List-of-LOS (LOLOS) is one of:
;; - empty
;; - (cons LOS LOLOS)

;; -- Functions

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