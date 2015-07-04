module Main where
  sortTuple (l, []) lt = (l, [])
  sortTuple (s, h:t) lt = sortTuple ((filter (fixed_lt) s) ++ [h] ++ (filter (not . fixed_lt) s), t) lt
    where fixed_lt = (\x -> (lt x) h)

  sortBy l lt = fst (sortTuple ([], l) lt)

  sort l = sortBy l (<)
