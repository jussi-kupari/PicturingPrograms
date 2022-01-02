;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2274) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 22.7.4
Develop a function count-words that takes in a string and tells how many words are in it.
A “word” is a sequence of letters, whether it’s one letter or ten, it counts as a single word.
Note also that there might be punctuation marks, spaces, multiple spaces, numbers, etc. in
between words.

Hint: This problem is similar to Exercise 22.5.19. In addition, you’ll probably want the
built-in function char-alphabetic?. Look it up in the Help Desk.
__

Note: My solution here can't handle quotes between alphabets and perhaps some other situations.
Not the most elegant solution.|#

;; count-words : String -> Natural
;; Given a string, produces the number of fully alphabetic words in it.
(check-error
 (count-words "") "Can't count words in an empty string!")
(check-expect
 (count-words "A “word” is a sequence of letters") 7)

(define (count-words str)
  (cond
    [(zero? (string-length str)) (error "Can't count words in an empty string!")]
    [(last-char-alphabetic? str)
     (add1 (count-words-in-nelos (string->list str)))]
    [else (count-words-in-nelos (string->list str))]))

;; last-char-alphabetic? : String -> Boolean
;; Given a string, produces true if the last character is alphabetic.
(check-expect (last-char-alphabetic? "abc") true)
(check-expect (last-char-alphabetic? "abc.") false)

(define (last-char-alphabetic? str)
  (string-alphabetic?
   (substring str (sub1 (string-length str)))))

;; count-words-in-nelos : NELOS -> Natural
;; Given a non-empty list of 1-strings, counts the number of times an alphabet
;; is followed by a non-alphabet.
(check-expect (count-words-in-nelos (cons #\space '())) 0)
(check-expect (count-words-in-nelos (cons #\a (cons #\b (cons #\c '())))) 0) ;note zero here! 
(check-expect (count-words-in-nelos (cons
                                   #\a
                                   (cons
                                    #\b
                                    (cons
                                     #\c
                                     (cons
                                      #\space
                                      (cons #\d (cons #\e (cons #\f (cons #\. '()))))))))) 2)

(define (count-words-in-nelos nelos)
  (cond
    [(empty? (rest nelos)) 0]
    [else (if (and (char-alphabetic? (first nelos))
                   (not (char-alphabetic? (first (rest nelos)))))
              (+ 1 (count-words-in-nelos (rest nelos)))
              (count-words-in-nelos (rest nelos)))]))