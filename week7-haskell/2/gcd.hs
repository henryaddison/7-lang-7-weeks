module Main where
  gcd a b
    | a == b = a
    | a > b = Main.gcd b a
    | otherwise = Main.gcd a (b-a)
