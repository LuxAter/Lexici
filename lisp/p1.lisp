#!/usr/bin/clisp
(defun SumDivisible (n m)
  (setq p (floor (float (/ m n))))
  (floor (/ (* n (* p (+ p 1))) 2))
  )

(defun sum (m)
  (setq val (- (+ (SumDivisible 3 m) (SumDivisible 5 m)) (SumDivisible 15 m)))
  (format t "~D" val))

(if (null *args*) (sum 999) (sum (-(parse-integer (pop *args*)) 1)))
