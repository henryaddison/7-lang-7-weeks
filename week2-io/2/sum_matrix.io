sum_matrix := method(matrix,
  total := 0 
  matrix foreach(row, total = total + (row sum))
  return total
)

sum_matrix(list(list(1,2), list(3,4,5))) println
