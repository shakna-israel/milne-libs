(namespace ("mstrings#" string-nth string-slice))

(define string-nth
  (lambda (str position)
    (cond
      [(= 0 position) (list->string (list (string-ref str position)))]
      [(positive? position) (list->string (list (string-ref str position)))]
      [(negative? position) (list->string (list (string-ref str (+ (string-length str) position))))]
      [else #f]
    )
  )
)

(define string-slice
  (lambda (str start finish)
    (cond
      [(= 0 finish) (string-nth str 0)]
      [(negative? start) #f]
      [(positive? finish) (substring str start finish)]
      [(negative? finish) (substring str start (+ (string-length str) finish))]
      [else #f]
    )
  )
)

