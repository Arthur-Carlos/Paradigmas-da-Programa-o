main :: IO ()
main = do
    putStrLn "Bem-vindo ao registro de notas dos alunos!"
    alunos <- montarNotas []
    let media = (sum (map snd alunos)) / fromIntegral (length alunos)
    putStrLn "Notas dos alunos:"
    exibirLista alunos
    putStrLn ("Média da turma: " ++ show media)

montarNotas :: [(String, Float)] -> IO [(String, Float)]
montarNotas lista = do
    putStrLn "Digite o nome do aluno:"
    nome <- getLine
    putStrLn "Digite a nota do aluno:"
    notaStr <- getLine
    let nota = read notaStr :: Float
    putStrLn "Quer adicionar mais um aluno? (s/n)"
    resposta <- getLine
    let novaLista = lista ++ [(nome, nota)]
    if resposta == "s"
        then montarNotas novaLista
        else return novaLista

exibirLista :: [(String, Float)] -> IO ()
exibirLista [] = return ()
exibirLista ((nome, nota):xs) = do
    putStrLn (nome ++ ": " ++ show nota)
    exibirLista xs