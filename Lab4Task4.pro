domains
file = text_input_file;text_output_file
int=real
intl=real*
 
predicates
nondeterm del_elt(int,intl,intl)
nondeterm uniq(intl,intl)
nondeterm readtolist(intl)
nondeterm printlist(intl)
nondeterm task
 
clauses
del_elt(_,[],[]).
del_elt(X,[X|T],R) :- del_elt(X,T,R).
del_elt(X,[Y|T],[Y|R]) :-  X<>Y,del_elt(X,T,R).
 
uniq([],[]).
uniq([X|T],[X|R]) :- del_elt(X,T,Y), uniq(Y,R).
 
readtolist([]):-eof(text_input_file),!.
  readtolist(N):-
    not(eof(text_input_file)),
    readreal(X),
    readtolist(N1),
    N=[X|N1].
    
printlist([]):-!.
  printlist([Head|Tail]):-
    write(Head), nl, printlist(Tail).
  
task :- openread(text_input_file, "D:\\University\\4thYear\\2nd semester\\ArtificialIntelligenceSystems\\Lab4\\f.txt"),
  readdevice(text_input_file),
  openwrite(text_output_file, "D:\\University\\4thYear\\2nd semester\\ArtificialIntelligenceSystems\\Lab4\\g.txt"),
  writedevice(text_output_file),
  readtolist(L),
  uniq(L,U),
  printlist(U),
  closefile(text_output_file);
  closefile(text_input_file).
 
goal
task.