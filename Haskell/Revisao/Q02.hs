main :: IO ()
main = do
    putStrLn"Digite a nota da P1:"
    entradaP1 <- getLine
    let notaP1 = read entradaP1 :: Double

    putStrLn"Digite a nota da P2:"
    entradaP2 <- getLine
    let notaP2 = read entradaP2 :: Double

    putStrLn"Digite a nota da P3:"
    entradaP3 <- getLine
    let notaP3 = read entradaP3 :: Double

    putStrLn"Digite a nota da P4:"
    entradaP4 <- getLine
    let notaP4 = read entradaP4 :: Double

    let notaMediaProva = (notaP1 + notaP2)/2
    let notaMediaTrab = (notaP3 + notaP4)/2
    let notaTotal = notaMediaProva * 0.8 + notaMediaTrab * 0.2
    if notaTotal < 6 then putStrLn "Reprovado" else putStrLn "Aprovado"