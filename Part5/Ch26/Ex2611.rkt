;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2611) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 26.1.1
Choose some functions defined in Chapters 22, 23, 24, and 25, and try
timing them on various sizes of arguments. How much does the time vary from one trial
to the next? From timing a few arguments, can you predict how long it’ll take on a new
argument?

Hint: You can use randoms, from Exercise 24.1.11, to generate large lists of numbers.
Make sure you don’t count the time to generate the numbers in the time to run the function.
One way to do this is to define a variable to hold a list of, say, 10000 random numbers,
and then call (time (the-function-I’m-testing lotsa-numbers)).
Some good ones to try are
convert-reversed, exercise 22.5.10
all-match?, exercise 22.5.13
largest, exercise 22.5.17
count-blocks, exercise 22.5.18
stutter, exercise 23.1.6
backwards, exercise 23.1.10
unique, exercise 23.2.4
tally-votes, exercise 23.2.7
sort, exercise 23.6.1
subsets, exercise 23.6.3
scramble, exercise 23.6.4
factorial, exercise 24.1.8
fibonacci, exercise 24.1.9
wn-add, exercise 24.3.1
wn-mult, exercise 24.3.2
wn-raise, exercise 24.3.3
wn-prime?, exercise 24.3.8
binary-add, exercise 25.4.9
binary-mult, exercise 25.4.10
binary-raise, exercise 25.4.11
substring?, exercise 25.4.12
subsequence?, exercise 25.4.13
lcsubstring, exercise 25.4.14
lcsubsequence, exercise 25.4.15

See Ex25414 where I test the 'lcsubstring' function on a short and long input string using 'time'.

|#


