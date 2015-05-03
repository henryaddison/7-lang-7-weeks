trait Censor {
   val swears = io.Source.fromFile("swears.txt").getLines.map(line => (line.split(":")(0), line.split(":")(1))).toMap

  def no_swears(uncensored : String) : String = {
    uncensored.split(" ").map(word =>
      if(swears.contains(word)) {
        swears(word)
      } else {
        word
      }
    ).mkString(" ")
  }
}

object Censorer extends Censor {
  def clean(uncensored : String ) = {
    println(no_swears(uncensored))
  }
}

Censorer.clean("shoot those darn birds")
