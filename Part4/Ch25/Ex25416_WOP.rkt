;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25416_WOP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.16
A common task in computer science is pattern-matching: given a
pattern, ask whether a particular string matches it. In our pattern language, a "?" stands
for “any single character,” while "*" stands for “any zero or more characters.” For
example, the pattern "c?t" would match “cat” and “cut” but not “colt”, “cats”, or “dog”.
Similarly, the pattern "cat*" would match the strings “cat”, “cats”, “catastrophe”, etc.
but not “caltrop” or “dog”. The pattern "a??a*r" would match “abbatoir”, “akbar”, and
“araaar”, etc. but not “almoner”, “alakazam”, or “fnord”. The pattern "*.docx" would
match the name of any Word 2007 file (and thus could be used to decide which filenames
to show in a file dialog).

Define a function pattern-match? that takes in two strings: the pattern and the
target, and tells whether the target matches the pattern.
Note that the special characters "?" and "*" are special only when they appear in the
pattern; if they appear in the target, they should be treated as ordinary characters.|#