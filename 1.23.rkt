#lang racket

(define (square x) (* x x))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor)))))

(define (next a)
  (if (= a 2) 3
      (+ a 2)))

(define (divides? a b)
  (= (remainder b a) 0))


(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (current-inexact-milliseconds)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) 
                       start-time) n)
      (values)
      ))
(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a b)
  (search-primes a b a))

(define (search-primes a b count)
  (timed-prime-test count)
  (if (> count (- b 2)) 0
      (search-primes a b (+ 2 count))))

  
(search-for-primes 1 100)


