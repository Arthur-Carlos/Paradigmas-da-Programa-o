import Data.Char

square :: Int -> Int
square x = x * x

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

fat :: Int -> Int
fat 0 = 1
fat 1 = 1
fat x = x * fat(x-1)

maxi :: Int -> Int -> Int
maxi n m    
    | n >= m = n
    | otherwise = m

sales :: Int -> Int
sales 0 = 0
sales n
    |mod n 2 == 0 = 10
    |otherwise = 20

totalSales :: Int -> Int
totalSales n
    | n == 0 = sales 0
    | otherwise = totalSales (n-1) + sales n

maxSales :: Int -> Int
maxSales n
    | n == 0 = sales 0
    | otherwise = maxi (maxSales (n-1)) (sales n)

countSalesEqual :: Int -> Int -> Int
countSalesEqual s 0
    | sales 0 == s = 1
    | otherwise = 0
countSalesEqual s n
    | sales n == s = 1 + countSalesEqual s (n-1)
    | otherwise = countSalesEqual s (n-1)

offset :: Int
offset = ord 'A' - ord 'a'

capitalize :: Char -> Char
capitalize ch = chr (ord ch + offset)

isDigit :: Char -> Bool
isDigit ch = (ch >= '0') && (ch <= '9')

makeSpaces :: Int -> String
makeSpaces 0 = ""
makeSpaces n = makeSpaces (n-1) ++ " "

pushRight :: Int -> String -> String
pushRight n m = m ++ makeSpaces n

averageSales :: Int -> Float
averageSales n = fromIntegral (totalSales n) / fromIntegral n

oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float -> (Float, Float)
twoRoots a b c = (d-e, d+e)
    where
    d = -b/(2.0*a)
    e = sqrt(b^2-4.0*a*c)/(2.0*a)

roots :: Float -> Float -> Float -> String
roots a b c
    |   b^2 == 4.0*a*c = show (oneRoot a b c)
    |   b^2 > 4.0*a*c = show f ++ " " ++show s
    |   otherwise = "no roots"
        where (f,s) = twoRoots a b c
