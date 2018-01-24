#! /usr/bin/clisp
(defun ReverseInteger (n)
  (setq reversed 0)
  (setq val n)
  (loop while (> val 0) do
        (setq reversed (+ (* 10 reversed) (mod val 10)))
        (setq val (floor (/ val 10))))
  (return-from ReverseInteger reversed)
  )
(defun IsPalindrome (n)
  (= n (ReverseInteger n))
  )

(defun Run (cnt)
  (setq tmp cnt)
  (setq mx 0)
  (loop while (> tmp 0) do
        (setq mx (+ (* mx 10) 9))
        (setq tmp (- tmp 1)))
  (setq a mx)
  (setq largest 0)
  (loop while (>= a (* 10 cnt)) do
        (setq b 0)
        (setq db 0)
        (if (= (mod a 11) 0)
          (progn
            (setq b mx)
            (setq db 1))
          (progn
            (setq b (* 11 (floor (/ mx 11))))
            (setq db 11)))
        (loop while (>= b a) do
              (if (<= (* a b) largest)
                (return)
                (if (IsPalindrome (* a b))
                  (setq largest (* a b))))
              (setq b (- b db))
              )
        (setq a (- a 1))
        )
  (format t "Largest palindrome multiples of ~D digits: ~D" cnt largest)
  )

(if (null *args*) (run 3) (run (parse-integer (pop *args*))))
