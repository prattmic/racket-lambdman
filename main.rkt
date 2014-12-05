#lang racket

(define (main world-file)
    (printf "world: ~a\n" world-file))

(define args (current-command-line-arguments))

(if (equal? 1 (vector-length args))
    (main (vector-ref args 0))
    (printf "usage: main world.txt\n"))
