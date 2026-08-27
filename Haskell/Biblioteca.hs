names :: [String]
names = ["Ana", "Joao", "Marian", "Lu", "Pedro", "Clara"]

--filter :: (a -> Bool) -> [a] -> [a]

longNames :: [String]
longNames = filter (\name -> length name > 3) names

--map :: (a -> b) -> [a] -> [b]

doubledNumbers :: [Int]
doubledNumbers = map (*2) [1, 2, 3, 4]

--foldr :: (a -> b -> b) -> b -> [a] -> b

sumNumbers :: Int
sumNumbers = foldr (+) 0 [1, 2, 3, 4]

concatenatedString :: String
concatenatedString = foldr (++) "" ["Hello ", "World", "!"]

--any :: (a -> Bool) -> [a] -> Bool

hasLongName :: Bool
hasLongName = any (\name -> length name > 5) names


type Person = String
type Book = String
type Database = [(Person, Book)]

exampleBase = [("Alice","Postman Pat"), ("Anna","All Alone"), ("Alice","Spot"), ("Rory","Postman Pat")]

books :: Database -> Person -> [Book]
books [] _ = []
books ((p,b):xs) person
    | p == person = b : books xs person
    | otherwise = books xs person

books2 :: Database -> Person -> [Book]
books2 db person = map snd (filter(\(p,b) -> p == person) db)

borrowers :: Database -> Book ->[Person]
borrowers [] _ = []
borrowers((p,b):xs) book
    | b== book = p : borrowers xs book
    | otherwise = borrowers xs book

borrowers2 :: Database -> Book ->[Person]
borrowers2 db book = map fst (filter(\(p,b) -> b == book) db)

borrowed :: Database ->Book -> Bool
borrowed [] _ = False
borrowed((p,b):xs) book
    | b == book = True
    | otherwise = borrowed xs book

borrowed2 :: Database -> Book -> Bool
borrowed2 db book = any(\(_, b) -> b== book ) db

numBorrowed :: Database -> Person -> Int
numBorrowed [] _ = 0
numBorrowed ((p,b):xs) person
    | p == person = 1 + numBorrowed xs person
    | otherwise = numBorrowed xs person

numBorrowed2 :: Database -> Person -> Int
numBorrowed2 db person = length( filter (\(p,b)-> p == person) db)

makeLoan :: Database -> Person -> Book -> Database
makeLoan [] person book = [(person, book)]
makeLoan ((p,b):xs) person book = (p,b): makeLoan xs person book

returnLoan :: Database -> Person -> Book -> Database
returnLoan [] person book = []
returnLoan ((p,b):xs) person book
    | p == person && b == book = returnLoan xs person book
    | otherwise = (p,b): returnLoan xs person book

returnLoan2 :: Database -> Person -> Book -> Database
returnLoan2 db person book = filter(\(p,b)-> not(p == person && b == book)) db

member :: [Int] -> Int -> Bool
member xs y = or [x == y | x <-xs]

books3 :: Database -> Person -> [Book]
books3 db person = [b| (p,b) <-db, p == person]

borrowers3 :: Database -> Book ->[Person]
borrowers3 db book = [p| (p,b)<-db, b == book]

borrowed3 :: Database -> Book -> Bool
borrowed3 db book = or[ b == book| (p,b)<-db]

numBorrowed3 :: Database -> Person -> Int
numBorrowed3 db person = length[p| (p,b)<-db, p == person]

returnLoan3 :: Database -> Person -> Book -> Database
returnLoan3 db person book = [(p,b)| (p,b)<-db, not(p == person && b == book) ]