main :: IO ()
main = do
    putStrLn "Digite o custo base do Carro"
    custoEntrada <- getLine
    let custoBase = read custoEntrada :: Double
    let custoTaxa = 0.12
    let custoMontagem = 0.3
    let custoTotal = custoBase + (custoBase * custoTaxa) + (custoBase * custoMontagem)
    putStrLn ("Total: " ++ show custoTotal)