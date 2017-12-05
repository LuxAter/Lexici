#! /usr/bin/clisp
(defun isprime (p)
  (cond ((= p 1) nil)
        ((< p 4) t)
        ((= (mod p 2) 0) nil)
        ((< p 9) t)
        ((= (mod p 3) 0) nil)
        (t
          (loop for i from 5 to (floor (sqrt p)) by 6
                never (zerop (mod p i))
                never (zerop (mod p (+ i 2)))))))

(defun primes (limit)
  (setq count 1)
  (setq val 1)
  (loop 
    (setq val (+ val 2))
    (if (isprime val) (setq count (+ count 1)))
    (if (>= count limit) (return)))
(format t "~D\'th Prime: ~D" limit val))

(if (null *args*) (primes 10001) (primes (parse-integer (pop *args*))))
