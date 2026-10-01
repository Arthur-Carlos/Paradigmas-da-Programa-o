main :: IO ()
main = do
    putStrLn"Digite a palavra a ser verificada:"
    palavraEntrada <- getLine
    if length palavraEntrada > 20
        then
            putStrLn "ERRO!"
        else do
            if isPalindromo palavraEntrada then
                putStrLn "É Palindromo"
            else
                putStrLn "Não é Palindromo"

isPalindromo :: String -> Bool
isPalindromo palavra = palavra == reverse palavra