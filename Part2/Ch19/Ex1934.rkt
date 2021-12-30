;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1934) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 19.3.4
; Develop a function safe-double that takes in a number, a string,
; a boolean, or an image. If the input is a number, the function
; doubles it and returns the result. If the input is anything else,
; the function produces an appropriate error message,
; e.g.
; "safe-double: This function expects a number, like 3. You gave it a picture."
; 
; or (even cooler)
; 
; "safe-double: This function expects a number, like 3
; You gave it the quoted string “five”."
; 
; Hint: The second example calls for inserting the actual string
; you were given into your error message. This can be done using
; string-append, or using the format function, which I haven’t told
; you about yet. If you wish, look it up and rewrite the function that way.
(require picturing-programs)

;; safe-double : Number|String|Boolean|Image -> Number|error
;; Given number, string, boolean or image
;; produces 2x number if the input is a number, else an error
(check-expect (safe-double 2) 4)
(check-error (safe-double "abc")
 "safe-double: This function expects a number, like 3. You gave it a string.")
(check-error (safe-double false)
 "safe-double: This function expects a number, like 3. You gave it a boolean.")
(check-error (safe-double (circle 10 "solid" "black"))
 "safe-double: This function expects a number, like 3. You gave it an image.")
                                                                                
;; safe-double
(define (safe-double i)
  (cond
    [(number? i) (* i 2)]
    [(string? i)
     (error 'safe-double
            "This function expects a number, like 3. You gave it a string.")]
    [(boolean? i)
     (error 'safe-double
            "This function expects a number, like 3. You gave it a boolean.")]
    [(image? i)
     (error 'safe-double
            "This function expects a number, like 3. You gave it an image.")]))                                                                            