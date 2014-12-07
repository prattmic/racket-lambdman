#lang racket

; World map structures and tools

(provide
 ; Read map from file and provide it as a 2d list
 read-map)

(require racket/file)

(define (list-equal? l)
  (if (equal? 1 (length l))
      #t
      (if (equal? (first l) (second l))
          (list-equal? (rest l))
          #f)))

(define (rectangular-2d-list? l)
  (define lengths (map length l))
  (list-equal? lengths))

(define (map-char->map-symbol map-char)
  (match map-char
    [#\space 'empty]
    [#\# 'wall]
    [#\. 'pill]
    [#\o 'power-pill]
    [#\% 'fruit]
    [#\\ 'lambda-man]
    [#\= 'ghost]))

(define/contract (read-map file)
  (-> string? rectangular-2d-list?)
  (define lines (file->lines file))
  (filter (negate empty?) ; remove empty lines
          (map (lambda (line) ; convert line to map symbols
                       (map map-char->map-symbol
                            (string->list line)))
               lines)))
