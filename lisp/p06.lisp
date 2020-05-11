#!/usr/bin/clisp

(defun run (limit)
  (setq sum (* limit (/ (+ limit 1) 2)))
  (setq sum_sq (* (+ (* 2 limit) 1) (* (+ limit 1) (/ limit 6))))
  (setq diff (- (expt sum 2) sum_sq))
  (format t "~D" diff)
  )

(if (null *args*) (run 100) (run (parse-integer (pop *args*))))
