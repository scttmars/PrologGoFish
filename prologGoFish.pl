takeout(_,[],[],0).
takeout(X,[H|T],B,Y) :- H = X, takeout(X,T,B,C),  Y is C + 1.
takeout(X,[H|T],[H|T1],Y) :- H \= X, takeout(X,T,T1,Y).

putIn([],_,0,[]).
putIn([],X,Y,[X|T2]) :- Z is Y - 1, putIn([],X,Z,T2).
putIn([H|T], X, Y, [H|L]) :- putIn(T,X,Y,L).

count(_,[],0).
count(X,[H|T],Y) :- H = X, count(X,T,B), Y is B + 1.
count(X,[H|T],Y) :- H \= X, count(X,T,Y).


deleteNum(_, [],[],_).
deleteNum(A, [H|T], [H|H2],Y) :- A \= H,  deleteNum(A,T,H2,Y), !.
deleteNum(A, [H|T], L1,Y) :- Y \= 0, A = H, Z is Y - 1, deleteNum(A,T,L1,Z).
deleteNum(A, [H|T], [H|H2],Y) :- Y = 0,  deleteNum(A,T,H2,Y), !.

groupFours([],S,[],S).
groupFours([H|T],L3,L2,L1) :-
    count(H,[H|T],Y), Y >= 4,
    putIn(L3,H,1,L1),
    deleteNum(H,[H|T],L2,4),
    groupFours(T,L3,L2,L1).
groupFours([H|T],S1,[H|T2],S2) :-
    count(H,[H|T],Y), Y < 4,
    groupFours(T,S1,T2,S2).
