#lang racket

(require racket/cmdline)

(define world-file
    (command-line
     #:program "lambdaman"
     #:args (filename) ; expect one argument, the filename
     filename)) ; return the filename

(printf "world: ~a\n" world-file)
