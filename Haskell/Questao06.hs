{-Faça um programa em Haskell que leia um número inteiro N (máximo
20) e, em seguida, gere e exiba os primeiros N números da sequência
de Fibonacci. Além disso, o programa deve calcular e exibir a soma dos
números gerados.-}

fiboseq :: Int -> Int -> Int -> [Int]
fiboseq 0 _ _ = []
fiboseq n x y = x :fiboseq(n-1) y (x + y)

soma :: [Int] -> Int
soma [] = 0
soma (a:xs) = a + soma xs

main :: IO ()
main = do
    putStrLn "Entrada:"
    entrada <- getLine
    let n = read entrada :: Int
    let vetor = fiboseq n 0 1
    putStrLn (show vetor)
    let total = soma vetor
    putStrLn (show total)