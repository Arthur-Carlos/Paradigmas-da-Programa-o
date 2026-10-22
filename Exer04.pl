progenitor(jose, joao).
progenitor(jose, ana).

progenitor(maria, joao).
progenitor(maria, ana).

progenitor(ana, helena).
progenitor(ana, joana).

progenitor(joao, mario).

progenitor(helena, carlos).
progenitor(mario, carlos).

masculino(joao).
masculino(jose).
masculino(carlos).
masculino(mario).

feminino(maria).
feminino(ana).
feminino(helena).
feminino(joana).

pai(X,Y):- progenitor(X,Y), masculino(X).
mae(X,Y):- progenitor(X,Y), feminino(Y).

irma(X,Y):-progenitor(Z,X), progenitor(Z,Y), feminino(X), X\==Y.
irmao(X,Y):-progenitor(Z,X), progenitor(Z,Y), masculino(X), X\==Y.

avoM(X,Y):- progenitor(X,Z), progenitor(Z,Y), masculino(X).
avoF(X,Y):- progenitor(X,Z), progenitor(Z,Y), feminino(X).

tio(X,Y):- progenitor(Z,Y), irmao(X,Z).
tia(X,Y):- progenitor(Z,Y), irma(X,Z).

primo(X,Y):-progenitor(A,Y), progenitor(B,X), (irmao(A,B) ; irma(A,B)), X\==Y.

descendente(X,Y):- progenitor(Y,X).
descendente(X,Y):- progenitor(Y,Z), progenitor(Z,X).
