sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = a + sumList as

double :: [Int] -> [Int]
double [] = []
double (a : as) = (a * 2) : double as

member :: [Int] -> Int -> Bool
member [] _ = False
member (a: as) x
    | a == x = True
    |otherwise = member as x

digits :: String -> String
digits [] = []
digits (a: as)
    |(a >= '0') && (a <= '9') = a:digits as
    |otherwise = digits as

sumPairs :: [(Int,Int)]->[Int]
sumPairs [] = []
sumPairs((x,y):as) = x + y: sumPairs as

ins :: Int -> [Int] -> [Int]
ins a [] = [a]
ins a (x:xs)
    | a <= x = a :x :xs
    | otherwise = x : ins a xs

iSort :: [Int] -> [Int]
iSort [] = []
iSort (a:as)  = ins a (iSort as)

firstDigit :: String -> Char
firstDigit st = case (digits st) of
            [] -> '\0'
            (a:as) -> a