#!/usr/bin/clisp

(defun run (limit)
  (setq cross_limit (floor (sqrt limit)))
  (setf sieve (make-array '(2000000) :initial-element 0))
  (loop for n from 4 to (- limit 1) by 2 do
        (setf (aref sieve n) 1)
        )
  (loop for n from 3 to (- cross_limit 1) by 2 do
        (if (= (aref sieve n) 0)
            (loop for m from (* n n) to (- limit 2) by (* 2 n) do
                  (setf (aref sieve m) 1)
                  )
            )
        )
  (setq sum 0)
  (loop for n from 2 to (- limit 1) do
        (if (= (aref sieve n) 0)
            (setq sum (+ sum n))
            )
        )
  (format t "~D" sum)
  )

(if (null *args*) (run 2000000) (run (parse-integer (pop *args*))))
