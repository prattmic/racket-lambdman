#lang racket

(require racket/cmdline)

(require "map.rkt")

(define map-file
  (command-line
    #:program "lambdaman"
    #:args (filename) ; expect one argument, the filename
    filename)) ; return the filename

(define game-map (read-map map-file))

(printf "Map:\n~a\n" game-map)
(printf "Map level: ~a\n" (map-level game-map))
