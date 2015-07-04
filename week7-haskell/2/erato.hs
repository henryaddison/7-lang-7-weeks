module Main where
  sieve a b 
    | b == 1 = False
    | a == b = True
    | otherwise = (mod b a) /= 0

  erato m 1 numbers = numbers
  erato m n numbers
    | m > (floor (sqrt n)) = numbers
    | otherwise = erato (m+1) n (filter (sieve (head (drop m numbers))) numbers)

  nthPrime n = head (drop (n-1) (erato 0 n [2..]))

  primes = map nthPrime [1..]
