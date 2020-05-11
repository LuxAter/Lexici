#!/usr/bin/clisp

(defun run (sum)
  (setq prod 0)
  (loop for a from 3 to (/(- sum 3) 3)do
        (loop for b from (+ a 1) to (/ (- (- sum 1) a) 2) do 
              (setq c (- (- sum a) b))
              (if (= (* c c) (+ (* a a) (* b b))) (setq prod (* (* a b) c)))
              )
        )
  (format t "~D" prod)
  )

(if (null *args*) (run 1000) (run (parse-integer (pop *args*))))
