;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2284) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 22.8.4
Develop a function count-strings-nested that takes in a nested string list and returns
the total number of simple strings in it, no matter how many levels of nested lists they’re inside.|#

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

;; count-strings-nested : NSL -> Natural
;; Given a NSL, produces the number of simple strings inside it.
(check-expect (count-strings-nested empty) 0)
(check-expect (count-strings-nested (cons
                                     "He"
                                     (cons
                                      "said"
                                      (cons
                                       (cons "Hello" empty)
                                       empty)))) 3)
(check-expect (count-strings-nested (cons
                                     "Jeff"
                                     (cons
                                      "said"
                                      (cons
                                       (cons "Bob" (cons "likes" (cons "Mary" empty)))
                                       (cons "yesterday" empty))))) 6)
(check-expect (count-strings-nested (cons
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
                                             "." empty)))))))))) 14)




(define (count-strings-nested nsl)
  (cond
    [(empty? nsl) 0]
    [(string? (first nsl))
     (+ 1
        (count-strings-nested (rest nsl)))]
    [else
     (+ (count-strings-nested (first nsl))
        (count-strings-nested (rest nsl)))]))