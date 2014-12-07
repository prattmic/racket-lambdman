#lang racket

(require racket/cmdline)

(require "world.rkt")

(define world-file
  (command-line
    #:program "lambdaman"
    #:args (filename) ; expect one argument, the filename
    filename)) ; return the filename

(define world-map (read-world-map world-file))

(print world-map)
