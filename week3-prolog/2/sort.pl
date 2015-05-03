my_sort([], [], Acc).
my_sort([X], [X], Acc).

my_sort([H|T], [HS|TS], Acc) :- smallest([H|T], H), 

