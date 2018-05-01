#! /usr/bin/clisp

(defun run (limit)
  (setq sum 0)
  (setq a 1)
  (setq b 1)
  (setq c 2)
  (loop 
        (setq sum (+ sum c))
        (setq a (+ b c))
        (setq b (+ c a))
        (setq c (+ a b))
        (when (> c limit) (return sum))
  )
  (format t "~D" sum))

(if (null *args*) (run 4000000) (run (-(parse-integer (pop *args*)) 1)))
