:- dynamic livro/4.

livro("Dom Quixote", "Miguel de Cervantes", 1605, disponivel).
livro("O Senhor dos Anéis", "J.R.R. Tolkien", 1954, disponivel).
livro("1984", "George Orwell", 1949, emprestado).
livro("A Metamorfose", "Franz Kafka", 1915, disponivel).
livro("O Pequeno Príncipe", "Antoine de Saint-Exupéry", 1943, emprestado).
livro("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997, disponivel).
livro("A Revolução dos Bichos", "George Orwell", 1945, disponivel).

disponivel(Titulo):- livro(Titulo,_,_,disponivel).
autor(Autor, Titulo):- livro(Titulo,Autor,_,_).
ano(Ano,Titulo):- livro(Titulo,_,Ano,_).
disponibilidade(Titulo, Resultado):- livro(Titulo,_,_,Resultado).

emprestar(Titulo):-
    retract(livro(Titulo,Autor,Ano,disponivel)),
    assert(livro(Titulo,Autor,Ano,emprestado)).

devolver(Titulo):-
    retract(livro(Titulo,Autor,Ano,emprestado)),
    assert(livro(Titulo,Autor,Ano,disponivel)).

