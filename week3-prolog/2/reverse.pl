my_reverse([],[]).
my_reverse([Head|Tail],RevList) :- reverse(Tail, RevTail), append(RevTail, [Head], RevList).
