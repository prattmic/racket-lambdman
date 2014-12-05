#lang racket

(require racket/cmdline)
(require racket/file)

(define world-file
    (command-line
     #:program "lambdaman"
     #:args (filename) ; expect one argument, the filename
     filename)) ; return the filename

(define (world-char->world-symbol world-char)
    (match world-char
        [#\space 'empty]
        [#\# 'wall]
        [#\. 'pill]
        [#\o 'power-pill]
        [#\% 'fruit]
        [#\\ 'lambda-man]
        [#\= 'ghost]))

(define world-map
    (map
     (lambda (line) (map world-char->world-symbol (string->list line)))
     (file->lines world-file)))

(print world-map)
