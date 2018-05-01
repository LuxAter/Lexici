#!/usr/bin/clisp

(defun is-prime (n)
  (cond ((= n 1) (return-from is-prime 0))
        ((< n 4) (return-from is-prime 1))
        ((= (mod n 2) 0) (return-from is-prime 0))
        ((< n 9) (return-from is-prime 1))
        ((= (mod n 3) 0) (return-from is-prime 0))
        (t (progn 
             (setq r (floor (sqrt n)))
             (setq f 5)
             (loop while (<= f r) do 
                   (cond ((= (mod n f) 0) (return-from is-prime 0))
                         ((= (mod n (+ f 2)) 0) (return-from is-prime 0))
                         )
                   (setq f (+ f 6))
                   )
             ))
        )
  (return-from is-prime 1)
  )

(defun run (limit)
  (setq cnt 1)
  (setq val 1)
  (loop while (< cnt limit) do 
        (setq val (+ val 2))
        (if (= (is-prime val) 1)
            (setq cnt (+ cnt 1))
            )
        )
  (format t "~D" val)
  )

(if (null *args*) (run 10001) (run (parse-integer (pop *args*))))
