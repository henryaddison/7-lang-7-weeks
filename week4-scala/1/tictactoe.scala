import scala.util.control.Breaks._

class Board {
  var rows = List(List(" ", " ", " "),List(" ", " ", " "),List(" ", " ", " "))

  def columns = {
    List(
      List(rows(0)(0), rows(1)(0), rows(2)(0)),
      List(rows(0)(1), rows(1)(1), rows(2)(1)),
      List(rows(0)(2), rows(1)(2), rows(2)(2))
    )
  }
  def diags = {
    List(
      List(rows(0)(0), rows(1)(1), rows(2)(2)),
      List(rows(0)(2), rows(1)(1), rows(2)(0))
    )
  }

  def play(mark: String, row: Int, column: Int) {
    if(rows(row)(column) == " ") {
      val new_row = rows(row).updated(column, mark)
      rows = rows.updated(row, new_row)
    }
    else {
      throw new IllegalArgumentException
    }
  }

  def won(mark: String) : Boolean = {
    rows.exists(row => 
      row == List(mark, mark, mark)
    ) ||
    columns.exists(row => 
      row == List(mark, mark, mark)
    ) ||
    diags.exists(row => 
      row == List(mark, mark, mark)
    )
  }

  def full : Boolean = {
    !rows.exists(row => 
      row.exists(entry => entry == " ")
    )
  }

  override def toString : String = {
    var s = ""
    rows.foreach { row =>
      row.foreach { entry => 
        s = s + entry + "|"
      }
      s = s + "\n"
    }
    return s
  }
}

class Game {
  val board = new Board
  val players = List("X", "O")

  def play {
    var player_index = 0
    while(true) {
      player_index = (player_index + 1) % 2
      var player = players(player_index)
      println("Go player " + player + ": ")
      print("Row: ")
      val row = readInt
      print("Column: ")
      val column = readInt
      board.play(player, row, column)
      println(board)
      if(board.won(player)) {
        println("Player " + player + " wins!")
        break
      } else {
        if(board.full) {
          println("It's a draw.")
          break
        } else {
          Nil
        }
      }
      
    }
  }
}

val g = new Game
g.play

