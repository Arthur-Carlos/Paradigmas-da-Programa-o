{-O custo ao consumidor de um carro novo é a soma do custo de fábrica
com a percentagem do distribuidor e dos impostos (aplicados ao custo
de fábrica). Supondo que a percentagem do distribuidor seja de 12% do
preço de fábrica e os impostos de 30% do preço de fábrica, fazer um
programa em Haskell para ler o custo de fábrica de um carro e imprimir
o custo ao consumidor.-}

main :: IO ()
main = do
    putStrLn "Digite o custo de fábrica do carro:"
    custoFabricaStr <- getLine
    let custoFabrica = read custoFabricaStr :: Double
    let percentualDistribuidor = 0.12
    let percentualImposto = 0.30
    let custoConsumidor = custoFabrica + (custoFabrica * percentualDistribuidor) + (custoFabrica * percentualImposto)
    putStrLn ("O custo ao consumidor do carro será: R$ " ++ show custoConsumidor)