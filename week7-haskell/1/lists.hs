module Main where
  size :: [t] -> Integer
  size [] = 0
  size (h:t) = 1 + size t
