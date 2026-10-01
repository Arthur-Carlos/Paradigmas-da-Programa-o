main :: IO ()
main = do
    putStrLn "Digite o seu Texto:"
    textoEntrada <- getLine
    putStrLn "Digite o caracter:"
    caracterEntrada <- getChar
    let ocorrencias = contador caracterEntrada textoEntrada
    putStrLn("O caracter "++ show caracterEntrada ++ " aparece " ++ show ocorrencias ++ " vezes no texto :" ++ show textoEntrada)

contador :: Char -> String -> Int
contador _ [] = 0
contador char (x : xs)
    |char == x = 1 + contador char xs
    |otherwise = contador char xs