{-
Elabore um programa em Haskell que leia as duas notas de prova (P1 e
P2) e duas notas de trabalho (T1 e T2) e posteriormente exiba a
mensagem ‘Aprovado’ ou ‘Não aprovado’ dependendo dos valores
obtidos, conforme as regras de cálculo definidas a seguir:
 Média de provas: MP = (P1 + P2)/2
 Média de trabalhos: MT = (T1 + T2)/2
 Média final: MF = 0,8MP + 0,2MT
 Situação:
◦ Se MF ≥ 6,0 → aprovado
◦ Se MF < 6,0 → não aprovado
-}
main :: IO ()
main = do
    putStrLn "Informe a primeira nota"
    nota01 <- getLine

    putStrLn "Informe a segunda nota"
    nota02 <- getLine

    putStrLn "Informe a terceira nota"
    nota03 <- getLine
    
    putStrLn "Informe a quarta nota"
    nota04 <- getLine

    let prova01 = read nota01 :: Double
    let prova02 = read nota02 :: Double
    let trabalho03 = read nota03 :: Double
    let trabalho04 = read nota04 :: Double

    let mediaProva = (prova01 + prova02)/2
    let mediaTrabalho = (trabalho03 + trabalho04)/2
    let mediaFinal = (mediaProva * 0.8) + (mediaTrabalho * 0.2)
    if mediaFinal < 6 then putStrLn ("Nao aprovado: "++ show mediaFinal) else putStrLn("Aprovado: "++ show mediaFinal)