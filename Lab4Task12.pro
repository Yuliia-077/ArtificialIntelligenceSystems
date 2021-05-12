domains
  file = text_input_file
  list_char = char*
  
predicates
  file_numbers_to_list(file, list_char, list_char)
  rem_dup_pack(list_char, list_char)
  reverse(list_char, list_char, list_char)
  printlist(list_char)
  
clauses
  file_numbers_to_list(File, Buffer, Buffer):-
    eof(File), !.
  file_numbers_to_list(File, Buffer, List):-
    readchar(Number), !,
    file_numbers_to_list(File, [Number|Buffer], List).
  file_numbers_to_list(_File, _Buffer, _List):-
    write("bad file"), nl, fail.
      
  rem_dup_pack([], []):-!.
  rem_dup_pack([A], [A]):-!.
  rem_dup_pack([A, B|Tail], Pack):-
    A = B, !, rem_dup_pack([B|Tail], Pack);
    rem_dup_pack([B|Tail], TailPack), Pack = [A|TailPack].
    
  printlist([]):-!.
  printlist([Head|Tail]):-
    write(Head), printlist(Tail).
  
  reverse([], R, R).
  reverse([H|T], A, R) :-
    	reverse(T, [H|A], R).

goal 
  openmodify(text_input_file, "D:\\University\\4thYear\\2nd semester\\ArtificialIntelligenceSystems\\Lab4\\input.txt"), !,
  readdevice(text_input_file), 
  file_numbers_to_list(text_input_file, [], List),
  reverse(List,[],R),
  rem_dup_pack(R, X),
  writedevice(text_input_file),
  filepos(text_input_file, 100, 0),
  printlist(X),
  closefile(text_input_file).