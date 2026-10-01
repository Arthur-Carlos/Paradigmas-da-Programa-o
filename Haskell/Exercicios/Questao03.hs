{-Faça um programa em Haskell em que o usuário forneça um texto e um
caractere a ser pesquisado nesse texto e que exiba o número de
ocorrências do caractere no texto.-}

main :: IO ()
main = do
    putStrLn"Digite o seu Texto: "
    textoEntrada <- getLine
    putStrLn"Digite o caracter a ser pesquisado: "
    caracterEntrada <- getChar

    let character = caracterEntrada
    let ocorrencia = contador textoEntrada character
    putStrLn ("O caractere '" ++ [character] ++ "' aparece " ++ show ocorrencia ++ " vezes no texto.")

contador :: String -> Char -> Int
contador textoEntrada c = length ( filter (== c) textoEntrada)