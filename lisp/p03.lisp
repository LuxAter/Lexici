#! /usr/bin/clisp

(defun run (n)
  (setq last_factor 1)
  (if ( = (mod n 2) 0)
    (progn
      (setq last_factor 2)
      (setq n (/ n 2))
      (loop while (= (mod n 2) 0)
            do (setq n (/ n 2)))
      )
    )
  (setq factor 3)
  (setq max_factor (sqrt n))
  (loop while (and (> n 1) (<= factor max_factor)) do
        (if (= (mod n factor) 0)
          (progn
            (setq n (/ n factor))
            (setq last_factor factor)
            (loop while (= (mod n factor) 0) do
                  (setq n (/ n factor)))
            (setq max_factor (sqrt n))))
        (setq factor (+ factor 2))
        )
  (if (not (= n 1))
    (setq last_factor n))
  (format t "~D" last_factor)
  )

(if (null *args*) (run 600851475143) (run (parse-integer (pop  *args*))))
