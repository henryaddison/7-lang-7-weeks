class Compass {
  val directions = List("north", "east", "south", "west")
  var bearing = 0
  println("Initial bearing: " + direction)

  def direction() = directions(bearing)

  def inform(directionTurned: String) {
    println("Turning " + directionTurned + " to face " + direction)
  }

  def turnLeft {
    bearing = (bearing-1+directions.size) %directions.size  
    inform("left")
  }

  def turnRight {
    bearing = (bearing+1) %directions.size  
    inform("right")
  }

}

val c = new Compass

c.turnRight
c.turnRight
c.turnLeft
c.turnLeft
c.turnLeft
c.turnLeft
c.turnLeft
c.turnRight
