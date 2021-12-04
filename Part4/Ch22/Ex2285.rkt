;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2285) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 22.8.5
Develop a function max-nesting-depth that takes in a nested string list and returns its
maximum nesting depth: empty has a nesting depth of 0, a list of strings has a nesting
depth of 1, a list that contains some lists of strings has a nesting depth of 2, etc.|#

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

;; -- Functions

;; max-nesting-depth : NSL -> Natural
;; Given an NSL, produces the level of nesting: empty 0, only-strings 1, each extra level +1
(check-expect
 (max-nesting-depth empty) 0)
(check-expect
 (max-nesting-depth (cons
                     "this"
                     (cons
                      "is"
                      (cons
                       "level"
                       (cons
                        "one"
                        empty))))) 1)
(check-expect
 (max-nesting-depth (cons
                     "this"
                     (cons
                      (cons "is" (cons "level" empty))
                      (cons
                       "two"
                       empty)))) 2)

(check-expect
 (max-nesting-depth (cons
                     "this"
                     (cons
                      (cons "is" (cons "level" empty))
                      (cons
                       "two"
                       empty)))) 2)


(check-expect(max-nesting-depth (cons
                                 "this"
                                 (cons
                                  (cons "is" (cons "level" (cons (cons "3" empty) empty)))
                                  (cons
                                   "three"
                                   empty)))) 3)



(define (max-nesting-depth nsl)
  (cond
    [(empty? nsl) 0]
    [(string? (first nsl))
     (max 1 (max-nesting-depth (rest nsl)))]
    [else
     (+ 1 (max (max-nesting-depth (first nsl))
               (max-nesting-depth (rest nsl))))]))




