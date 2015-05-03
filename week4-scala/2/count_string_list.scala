val list = List[String]("String 1", "String 2")

list.foldLeft(0)((sum, s) => sum+s.length)
