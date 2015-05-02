ListOfLists := List clone
ListOfLists dim := method(x,y,
  list_of_lists := ListOfLists clone
  for(i,1,y,1,
    current_list := list()
    for(j,1,x,1,
      current_list append(nil)
    )
    list_of_lists append(current_list)
  )
  return list_of_lists
)

ListOfLists get := method(x,y,
  self at(y) at(x) 
)

ListOfLists set := method(x,y,value,
  self at(y) atPut(x,value)
  self
)

ListOfLists transpose := method(
  x_size := self at(0) size
  y_size := self size
  new_lol := self dim(y_size, x_size)
  for(x,0,x_size-1, 
    for(y,0,y_size-1,
      new_lol set(y,x, self get(x,y))
    )
  )
  return new_lol
)

ListOfLists write_to_file := method(
  f := File with("matrix.txt")
  f remove
  f openForUpdating
  self foreach(row,
    f write(row join("\t"))
    f write("\n")
  )
  f close
)

ListOfLists read_from_file := method(
  f := File with("matrix.txt")
  lines := f readLines
  lines mapInPlace(line, line split("\t"))
  lol := self dim(lines at(0) size, lines size)
  lines foreach(y, row,
    row foreach(x, entry,
      lol set(x,y,entry)
    )
  )
  return lol
)

lol := ListOfLists dim(3,5) println

lol set(2,2, "hello")

lol get(2,2, "hello") println
