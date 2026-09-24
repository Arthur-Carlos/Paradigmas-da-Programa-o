{-Faça um programa em Haskell que permita ao usuário inserir um item de
gasto (ex.: “almoço”) e o valor. Após cada entrada, pergunte se ele quer
adicionar mais um gasto. No final, exiba o total dos gastos.-}

main :: IO ()
main = do
    putStrLn "Bem-vindo a sua Lista de compras"
    compras <- montarLista []
    let total = (sum(map snd compras))
    putStrLn ("Total: R$" ++ show total)

montarLista :: [(String, Float)] -> IO [(String,Float)]
montarLista lista = do
    putStrLn"Insira o Item:"
    itemEntrada <- getLine
    putStrLn"Insira o Valor do Item:"
    valorEntrada <- getLine
    let valor = read valorEntrada :: Float

    putStrLn"Quer adicionar mais algum Item? (s/n)"
    resposta <- getLine
    let novaLista = lista ++ [(itemEntrada, valor)]
    if resposta == "s"
        then montarLista novaLista
        else return novaLista