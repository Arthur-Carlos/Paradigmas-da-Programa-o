main :: IO ()
main = do
    putStrLn "Bem-vindo à sua lista de compras!"
    lista <- montarLista []
    putStrLn "Sua lista de compras completa é:"
    exibirLista lista

montarLista :: [String] -> IO [String]
montarLista lista = do
    putStrLn "Digite um item:"
    item <- getLine
    putStrLn "Quer adicionar mais um item? (s/n)"
    resposta <- getLine
    let novaLista = lista ++ [item]
    if resposta == "s"
        then montarLista novaLista
        else return novaLista

-- Função recursiva para exibir cada item da lista
exibirLista :: [String] -> IO ()
exibirLista [] = return ()
exibirLista (x:xs) = do
    putStrLn x
    exibirLista xs