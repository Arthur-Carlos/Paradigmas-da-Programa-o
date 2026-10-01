{-Faça um programa em Haskell em que o usuário entre com um vetor de
char de até 20 posições e verifica se o vetor é palíndromo (A palavra
arara é um palíndromo porque se invertermos a palavra teremos arara
novamente. Usar a função reverse)-}
palindromo :: String -> Bool
palindromo palavra = palavra == reverse palavra

main :: IO ()
main = do
    putStrLn"Digite o texto a ser verificado: "
    textoEntrada <- getLine
    let texto = textoEntrada
    if palindromo texto
        then putStrLn"Palindromo"
        else putStrLn"Nao Palindromo"