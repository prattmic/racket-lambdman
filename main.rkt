#lang racket

(require racket/cmdline)

(require "map.rkt")
(require "world.rkt")

(define map-file
  (command-line
    #:program "lambdaman"
    #:args (filename) ; expect one argument, the filename
    filename)) ; return the filename

(define world (new-world (read-map map-file)))

(printf "World:\n~a\n" world)
(printf "Map level: ~a\n" (world-map-level world))
