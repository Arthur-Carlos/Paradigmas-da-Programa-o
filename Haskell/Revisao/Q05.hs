main :: IO ()
main = do
    putStrLn "Teste"
    gastos <- montarGastos []
    let total = sum(map snd gastos)
    putStrLn "Seus gastos foram :"
    exibirLista gastos
    putStrLn ("Gasto total: "++ show total)

montarGastos :: [(String, Float)] -> IO [(String, Float)]
montarGastos lista = do
    putStrLn "Digite o nome:"
    nomeEntrada <- getLine
    putStrLn "Digite o valor:"
    valorEntrada <- getLine
    let valorPreco = read valorEntrada :: Float
    putStrLn"Quer inserir outro item?(s/n)"
    resposta <- getLine
    let novalista = lista ++ [(nomeEntrada, valorPreco)]
    if resposta == "s"
        then montarGastos novalista
        else return novalista

exibirLista :: [(String, Float)] -> IO()
exibirLista [] = return ()
exibirLista((item,valor):xs) = do
    putStrLn("Item: "++ item ++ ". Valor: "++ show valor)
    exibirLista xs