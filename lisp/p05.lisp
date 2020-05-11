#!/usr/bin/clisp

(defun run (k)
  (setq multiple 1)
  (setq i 0)
  (setq check 1)
  (setq limit (sqrt k))
  (setf p (make-array '(50)
                      :initial-contents '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229)
                      ))
  (loop while (<= (aref p i) k) do
        (setq a 1)
        (if (= check 1)
            (progn 
              (if (<= (aref p i) limit)
                  (setq a (floor (/ (log k) (log (aref p i)))))
                  (setq check 0)
                )
            )
        )
        (setq multiple (* multiple (expt (aref p i) a)))
        (setq i (+ i 1))
  )
  (format t "~D" multiple)
)

(if (null *args*) (run 20) (run (parse-integer (pop *args*))))
