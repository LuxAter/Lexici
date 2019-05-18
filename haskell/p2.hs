import System.Environment

main = do
  args <- getArgs
  print (problem_2 (if null args then (4000000) else (read $ head args :: Integer)))

problem_2 max = sum [ x | x <- takeWhile (<= max) fibs, even x]
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

