#lang racket

(provide
 ; Generate a new world based on map
 new-world
 ; Level of the world
 world-map-level)

(struct world (map)
        ; Display the map when displaying the world
        #:methods gen:custom-write
        [(define (write-proc world port mode)
            (define m (world-map world))
            (match mode
              [#t (write m port)]
              [#f (display m port)]
              [_  (print m port mode)]))])

; Generate a new world based on map
; Eventually more details will need to be derived
(define (new-world m)
  (world m))

(define (world-map-height w)
  (length (world-map w)))

(define (world-map-width w)
  (length (first (world-map w))))

(define (world-map-level w)
  (define size (* (world-map-height w) (world-map-width w)))
  (define normalized-size (/ size 100))
  (ceiling normalized-size))
