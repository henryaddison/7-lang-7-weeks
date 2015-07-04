module Main where
  reverseTuple :: ([t],[t]) -> ([t], [t])
  reverseTuple (r, []) = (r,[])
  reverseTuple (r, (h:t)) = reverseTuple ([h] ++ r, t)

  reverse :: [t] -> [t]
  reverse l = fst(reverseTuple([],l))

  let colours = ["black", "white", "yellow", "blue", "red"]
  let colourPairs = [ (a,b) | a <- colours, b <- colours, a /= b ]

  let timesTable = [(a,b,a*b) | a <- [1..12], b <- [1..12]]

  let mapColours = ["red", "green", "blue"]
  let mapSolutions = [(tennessee, mississippi, alabama, georgia, florida) | tennessee <- mapColours, mississippi <- mapColours, alabama <- mapColours, georgia <- mapColours, florida <- mapColours, mississippi /= tennessee, mississippi /= alabama, alabama /= georgia, alabama /= tennessee, alabama /= florida, georgia /= tennessee, georgia /= florida]
