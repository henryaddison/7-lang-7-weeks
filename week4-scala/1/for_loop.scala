def forLoop {
  println("using Java-style iteration")
  for(i <- 0 until args.length) {
    println(args(i))
  }
}

forLoop
