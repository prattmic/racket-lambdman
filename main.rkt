#lang racket

(require racket/cmdline)

(require "map.rkt")

(define map-file
  (command-line
    #:program "lambdaman"
    #:args (filename) ; expect one argument, the filename
    filename)) ; return the filename

(define game-map (read-map map-file))

(print game-map)
