-module(day2).
-export([kv_get/2]).
-export([total_price/1]).
-export([tictactoe/1, winner/2]).

kv_get(List, Key) -> 
  [H|_] = lists:filter(fun({K, _}) -> 
    if
      K == Key -> true;
      true -> false
    end
  end, List),
  {_, Value} = H,
  Value.

total_price(Quantities) -> [{Item, Price * Quantity} || {Item, Price, Quantity} <- Quantities].

winner(Board, Mark) ->
  [R1C1, R1C2, R1C3, R2C1, R2C2, R2C3, R3C1, R3C2, R3C3] = Board,
  if 
    R1C1 == Mark, R2C2 == Mark, R3C3 == Mark -> true;
    R1C3 == Mark, R2C2 == Mark, R3C1 == Mark -> true;
    R1C1 == Mark, R1C2 == Mark, R1C3 == Mark -> true;
    R2C1 == Mark, R2C2 == Mark, R2C3 == Mark -> true;
    R3C1 == Mark, R3C2 == Mark, R3C3 == Mark -> true;
    R1C1 == Mark, R2C1 == Mark, R3C1 == Mark -> true;
    R1C2 == Mark, R2C2 == Mark, R3C2 == Mark -> true;
    R1C3 == Mark, R2C3 == Mark, R3C3 == Mark -> true;
    true -> false
  end.

tictactoe(Board) ->
  XWon = day2:winner(Board, x),
  OWon = day2:winner(Board, o),
  if
    XWon -> x;
    OWon -> o;
    true -> cat
  end.
