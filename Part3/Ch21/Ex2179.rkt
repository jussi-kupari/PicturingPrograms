;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2179) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.9
; Modify Exercise 18.2.5 (typing into the animation window) so there’s
; a vertical-bar cursor showing where you’re currently typing. The right-arrow
; key should move the cursor one character to the right (unless it’s already at
; the end of the text), left-arrow one character to the left (unless it’s already
; at the beginning), any ordinary character you type should be inserted into the
; text where the cursor is (and the cursor should move to the right), and the key
; ”backspace” should delete the character just before the cursor.
; 
; Hint: You’ll need to define a structure to represent both the string that
; appears in the window and the location of the cursor. One good way to do
; this is to store two strings: the text before the cursor and the text after
; the cursor.
(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 250 20))

;Cursor
(define CURSOR (text "|" 18 "red"))

;; -- Data Definition

(define-struct txt (pre post))
;; Txt is (make-text String String)
;; interp. Two strings with the cursor in between

(define TEXT (make-txt "jussi" "kupari"))

;; -- Functions

;; main : Txt -> Txt

(define (main tx)
  (big-bang tx
    (on-key next-txt)
    (to-draw render-editor)))

;; next-txt : Txt KeyEvent -> Txt
;; Given Txt and a keyEvent, produces the next Txt
(check-expect (next-txt (make-txt "" "") " ") (make-txt " " ""))
(check-expect (next-txt (make-txt "a" "") "b") (make-txt "ab" ""))
(check-expect (next-txt (make-txt "ab" "") "c") (make-txt "abc" ""))
(check-expect (next-txt (make-txt "abc" "") "left") (make-txt "ab" "c"))
(check-expect (next-txt (make-txt "" "ab") "left") (make-txt "" "ab"))
(check-expect (next-txt (make-txt "ab" "cd") "right") (make-txt "abc" "d"))
(check-expect (next-txt (make-txt "abc" "") "right") (make-txt "abc" ""))
(check-expect (next-txt (make-txt "abc" "") "\b") (make-txt "ab" ""))
(check-expect (next-txt (make-txt "abc" "") "up") (make-txt "abc" ""))

(define (next-txt tx ke)
  (cond
    [(and (= (string-length (txt-pre tx)) 0) (key=? "left" ke)) tx]
    [(and (= (string-length (txt-pre tx)) 0) (key=? "\b" ke)) tx]
    [(and (= (string-length (txt-post tx)) 0) (key=? "right" ke)) tx]
    [(key=? "left" ke) (make-txt (remove-last (txt-pre tx)) (add-last-of-pre tx))]
    [(key=? "right" ke) (make-txt (add-first-of-post tx) (remove-first (txt-post tx)))]
    [(key=? "\b" ke) (make-txt (remove-last (txt-pre tx)) (txt-post tx))]
    [(= (string-length ke) 1)  (make-txt (string-append (txt-pre tx) ke) (txt-post tx))]
    [else  tx]))

;; remove-last : String -> String
;; Given a string, produces the string without the last character

(define (remove-last s)
  (substring s 0 (sub1 (string-length s))))

;; remove-first : String -> String
;; Given a string, produces the string without the first character

(define (remove-first s)
  (substring s 1))

;; add-last-of-pre : Txt -> String
;; Given a Txt, produces the post-part with the last character of pre-part added at the start

(define (add-last-of-pre tx)
  (string-append (string-ith (txt-pre tx) (sub1 (string-length (txt-pre tx))))
                 (txt-post tx)))

;; add-first-of-post : Txt -> String
;; Given a Txt, produces the pre-part with the first character of post-part added at the end

(define (add-first-of-post tx)
  (string-append (txt-pre tx) (string-ith (txt-post tx) 0)))

;; render-text : Txt -> Image
;; Given Txt, produces an image of the text and cursor

(define (render-txt tx)
  (beside (text (txt-pre tx) 16 "black")
          CURSOR
          (text (txt-post tx) 16 "black")))

;; render-editor : Txt -> Image
;; Given image of text and the scene, produces final editor

(define (render-editor tx)
  (place-image (render-txt tx) (/ (image-width SCENE) 2) (* (image-height SCENE) 0.375) SCENE))