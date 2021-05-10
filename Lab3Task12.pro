Domains 
List = real*
Predicates
nondeterm lesser (list, real)
nondeterm delete (real, list, list)
nondeterm ordering (list, list)

Goal
Readterm(list,L), ordering(L,New_List),!.

Clauses
ordering([],[]).
ordering(L,[M|R]):- lesser(L, M), delete(M,L,Ll),
			ordering(Ll,R).
lesser([X],X).
lesser([X,Y|Z],U):- X>=Y, lesser([X|Z],U);
			X<Y, lesser([Y|Z],U). 
delete(E, [E|Y],Y).
delete(E, [X|Y],[X|Z]):- delete(E,Y,Z). 

