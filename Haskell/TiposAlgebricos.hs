data List t = Nil | Cons t (List t) deriving (Show)
data Tree t = Empty | Node t (Tree t) (Tree t) deriving (Show)
data Expr = Val Int | Add Expr Expr | Mul Expr Expr deriving (Show)

showExpr :: Expr -> String
showExpr (Val n) = show n
showExpr (Add e1 e2) = show e1 ++ " + " ++ show e2
showExpr (Mul e1 e2) = show e1 ++ " * " ++ show e2

toList :: List t -> [t]
toList Nil = []
toList (Cons x xs) = x : toList xs

fromList :: [t] -> List t
fromList [] = Nil
fromList (x: xs) = Cons x (fromList xs)

depth :: Tree t -> Int
depth Empty = 0
depth (Node _ x y) =  1 + max(depth x)(depth y)

colapse :: Tree t -> [t]
colapse Empty = []
colapse(Node x y z) = colapse y ++ [x] ++ colapse z

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree _ Empty = Empty
mapTree f (Node x y z) = Node (f x) (mapTree f y) (mapTree f z)
