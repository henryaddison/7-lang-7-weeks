-module(day1).
-export([selective_print/1]).
-export([count_up/1, count_to/1]).

selective_print(success) -> io:format("success~n");
selective_print({error, Message}) -> io:format("error: ~s~n", [Message]).

count_up(X) when X =< 0 -> io:format("Can't count up to a non-positive number!~n");
count_up(X) -> count_up(1,X).

count_up(X, X) -> io:format("~w~n", [X]);
count_up(X, Total) -> io:format("~w~n", [X]), count_up(X+1,Total).

count_to(X) when X =< 0 -> io:format("Can't count to a non-positive number!~n");
count_to(1) -> io:format("1~n");
count_to(X) -> count_to(X-1),io:format("~w~n", [X]).
