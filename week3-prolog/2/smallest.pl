smallest([Head|[]], Head).
smallest([Head|Tail], S) :- smallest(Tail, TailS), TailS < Head, S = TailS.
smallest([Head|Tail], S) :- smallest(Tail, TailS), TailS >= Head, S = Head.
