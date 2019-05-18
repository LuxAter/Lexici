import System.Environment

main = do
  args <- getArgs
  print (problem_1 (if null args then (999) else (read $ head args :: Integer)-1))

problem_1 max = sumStep 3 max + sumStep 5 max - sumStep 15 max
  where
    sumStep s n = s * sumOnetoN (n `div` s)
    sumOnetoN n = n * (n+1) `div` 2
