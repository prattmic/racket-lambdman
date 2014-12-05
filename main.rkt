#lang racket

(require racket/cmdline)
(require racket/file)

(define world-file
    (command-line
     #:program "lambdaman"
     #:args (filename) ; expect one argument, the filename
     filename)) ; return the filename

(define (world-char->world-symbol world-char)
    (cond
     [(char=? #\space world-char)
      'empty]
     [(char=? #\# world-char)
      'wall]
     [(char=? #\. world-char)
      'pill]
     [(char=? #\o world-char)
      'power-pill]
     [(char=? #\% world-char)
      'fruit]
     [(char=? #\\ world-char)
      'lambda-man]
     [(char=? #\= world-char)
      'ghost]
     [else #f]))    ; TODO: some kind of exception?

(define world-map
    (map
     (lambda (line) (map world-char->world-symbol (string->list line)))
     (file->lines world-file)))

(print world-map)
