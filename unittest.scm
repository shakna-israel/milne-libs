(namespace ("unittest#" test-passes test-fails test-totals test-results reportmsg reporterr check-equal-number? check-equal-other? check-equal?))

(define test-passes 0)
(define test-fails 0)
(define test-totals 0)

(define test-results
  (lambda ()
    (display "\033[1mResults:\033[0m\n")
    (display (string-append "\033[32mPass: \033[0m" (number->string test-passes) " out of " (number->string test-totals) "\n"))
    (display (string-append "\033[31mFail: \033[0m" (number->string test-fails) " out of " (number->string test-totals)))
    (display "\n")
    (if (= test-fails 0)
      (exit 0)
      (exit 1)
    )
  )
)

(define reportmsg
  (lambda (msg)
    (set! test-totals (+ test-totals 1))
    (set! test-passes (+ test-passes 1))
    (display "\033[32mPASS: \033[0m\n")
    (display msg)
    (newline)
    (newline)
  )
)


(define reporterr
  (lambda (msg a b)
    (set! test-totals (+ test-totals 1))
    (set! test-fails (+ test-fails 1))
    (display "\033[31mFAILURE: \033[0m\n")
    (display msg)
    (newline)
    (display "\033[32mExpected:\033[0m\n")
    (display b)
    (newline)
    (display "\033[31mReceived:\033[0m\n")
    (display a)
    (newline)
    (newline)
  )
)


(define check-equal-number?
  (lambda (a b msg)
    (if (= a b)
      (reportmsg msg)
      (reporterr msg a b)
    )
  )
)

(define check-equal-other?
  (lambda (a b msg)
    (if (equal? a b)
      (reportmsg msg)
      (reporterr msg a b)
    )
  )
)

(define check-equal?
  (lambda (a b msg)
    (cond
      [(number? b) (check-equal-number? a b msg)]
      [else (check-equal-other? a b msg)]
    )
  )
)

 ;
 ; End testing framework definition
 ;
