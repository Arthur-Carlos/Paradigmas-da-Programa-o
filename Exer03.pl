dados(amnesia, suspense, nolan, 2000, 113).
dados(babel, drama, inarrotu, 2006, 142).
dados(capote, drama, miller, 2005, 98).
dados(casablanca, romance, curtiz, 1942, 102).
dados(matrix, ficcao, wachowsk, 1999, 136).
dados(rebecca, suspense, hitchcock, 1940, 130).
dados(shrek, ficcao, adamson, 2001, 90).
dados(sinais, ficcao, shymalan, 2002, 106).
dados(spartacus, acao, kubrik, 1960, 184).
dados(superman, aventura, donner, 1978, 143).
dados(titanic, romance, cameron, 1997, 194).
dados(tubarao, suspense, spielberg, 1975, 124).
dados(volver, drama, almodavar, 2006, 121).

diretor(Titulo, Diretor):- dados(Titulo, _, Diretor, _, _).
genero(Genero, Titulo):- dados(Titulo, Genero, _, _, _).
anoLancamento(Titulo, Ano) :- dados(Titulo, _, _, Ano, _).
duracao(Limite, Titulo):- dados(Titulo, _, _, _, Duracao), Duracao =< Limite.
janelaLancamento(LimiteInf,LimiteSup, Titulo):-  dados(Titulo, _, _, Ano, _), Ano>= LimiteInf, Ano =< LimiteSup.
classicos(Titulo):- anoLancamento(Titulo,Ano), Ano =< 1980.
classicosSupense(Titulo):- classicos(Titulo), genero(suspense,Titulo).
