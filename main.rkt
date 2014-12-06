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

(define (list-equal? l)
  (if (equal? 1 (length l))
      #t
      (if (equal? (first l) (second l))
          (list-equal? (rest l))
          #f)))

(define (rectangular-2d-list? l)
  (define lengths (map length l))
  (list-equal? lengths))

(define/contract (read-world-map file)
  (-> string? rectangular-2d-list?)
  (define lines (file->lines file))
  (filter (negate empty?) ; remove empty lines
          (map (lambda (line) ; convert line to world symbols
                       (map world-char->world-symbol
                            (string->list line)))
               lines)))

(define world-map (read-world-map world-file))

(print world-map)
