#lang racket

; World map structures and tools

(provide
 ; Read map from file and provide it as a 2d list
 read-map
 ; Convert a map into a string (like normal input)
 map->string
 ; Output an ASCII version of the map
 display-map)

(require racket/file)

(define (map-char->map-symbol map-char)
  (match map-char
    [#\space 'empty]
    [#\# 'wall]
    [#\. 'pill]
    [#\o 'power-pill]
    [#\% 'fruit]
    [#\\ 'lambda-man]
    [#\= 'ghost]))

(define (map-symbol->map-char map-symbol)
  (match map-symbol
    ['empty #\space]
    ['wall #\#]
    ['pill #\.]
    ['power-pill #\o]
    ['fruit #\%]
    ['lambda-man #\\]
    ['ghost #\=]))

(define (map->char m)
  (for/list ([row m])
    (map map-symbol->map-char row)))

(define (map->string m)
  (define lines (map list->string (map->char m)))
  (for/fold ([ret ""])
            ([line lines])
    (string-append ret line "\n")))

(define (display-map m)
  (display (map->string m)))

(define (list-equal? l)
  (if (equal? 1 (length l))
      #t
      (if (equal? (first l) (second l))
          (list-equal? (rest l))
          #f)))

(define (rectangular-2d-list? l)
  (define lengths (map length l))
  (list-equal? lengths))

(define/contract (read-map file)
  (-> string? rectangular-2d-list?)
  (define lines (file->lines file))
  (filter (negate empty?) ; remove empty lines
          (map (lambda (line) ; convert line to map symbols
                       (map map-char->map-symbol
                            (string->list line)))
               lines)))

