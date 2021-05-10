domains
charlist = char* 
predicates
nondeterm string_chlist(string, charlist)
nondeterm task(charlist,integer)
 
clauses
string_chlist("",[]):-!. 
string_chlist(S,[H|T]):-frontchar(S,H,S1),
		string_chlist(S1,T).

task([_,_],0).
task([X,Y,Z|T],N) :- task([Y,Z|T],N1),X=' ', X=Y, Y=Z, N=N1+1,!.
task([_,Y,Z|T],N) :- task([Y,Z|T],N).


goal
Readln(Str), string_chlist(Str,Z), task(Z,N), write(N).