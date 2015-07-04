module Main where
  slowFib :: Integer -> Integer
  slowFib 0 = 1
  slowFib 1 = 1
  slowFib n = slowFib (n-2) + slowFib (n-1)

  fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
  fibTuple (0,x,y) = (0,x,y)
  fibTuple (index,x,y) = fibTuple(index-1,y,x+y)

  fibResult :: (Integer, Integer, Integer) -> Integer
  fibResult (index,x,y) = x

  fib :: Integer -> Integer
  fib x = fibResult(fibTuple(x,0,1))

  fibNextPair :: (Integer, Integer) -> (Integer, Integer)
  fibNextPair (x,y) = (y,x+y)

  fibNthPair :: Integer -> (Integer, Integer)
  fibNthPair 0 = (0,1)
  fibNthPair n = fibNextPair(fibNthPair(n-1))
