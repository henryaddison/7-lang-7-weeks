module Main where
  fib :: Integer -> Integer
  fib = fst . fibNthPair

  fibNextPair :: (Integer, Integer) -> (Integer, Integer)
  fibNextPair (x,y) = (y,x+y)

  fibNthPair :: Integer -> (Integer, Integer)
  fibNthPair 0 = (0,1)
  fibNthPair n = fibNextPair(fibNthPair(n-1))
