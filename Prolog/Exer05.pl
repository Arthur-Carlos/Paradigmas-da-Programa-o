maior([],_,[]).
maior([H|T],V,[H|R]):- H > V, !, maior(T,V,R).
maior([_|T], V, R) :- maior(T, V, R).
