module Sort where

import Data.List

someFunc :: IO ()
someFunc = putStrLn "someFunc"

quickSort :: Ord a => [a] -> [a]
quickSort []     = []
quickSort (x:xs) = quickSort [ x' | x' <- xs, x' < x] ++ [x] ++ quickSort [ x' | x' <- xs, x' >= x]

mergeSort :: Ord a => [a] -> [a]
mergeSort []  = []
mergeSort [x] = [x]
mergeSort xs  = sort' (mergeSort xs1) (mergeSort xs2)
  where
    (xs1, xs2) = splitAt (length xs `div` 2) xs
    -- given two sorted lists, returns a combined sorted list
    sort' xs [] = xs
    sort' [] ys = ys
    sort' xxs@(x:xs) yys@(y:ys)
      | x <= y    = x : sort' xs yys
      | otherwise = y : sort' xxs ys


heapSort :: Ord a => [a] -> [a]
heapSort = undefined

insertionSort :: Ord a => [a] -> [a]
insertionSort xs = foldl' sort' [] xs
  where
    sort' [] y = [y]
    sort' ys y
        | last ys > y = sort' (init ys) y ++ [last ys]
        | otherwise   = ys ++ [y]

selectionSort :: Ord a => [a] -> [a]
selectionSort [] = []
selectionSort xs = x : selectionSort (xs \\ [x])
  where x = minimum xs

bubbleSort :: Ord a => [a] -> [a]
bubbleSort [] = []
bubbleSort xs = bubbleSort (init xs') ++ [last xs']
  where
    xs' = sort' xs
    sort' []  = []
    sort' [x] = [x]
    sort' (x1:x2:xs)
      | x1 <= x2  = x1 : sort' (x2 : xs)
      | otherwise = x2 : sort' (x1 : xs)
    
timSort = undefined
shellSort = undefined

data Tree a = Null |
              Leaf a |
              Node (Tree a) a (Tree a)

treeSort :: Ord a => [a] -> [a]
treeSort xs = collapseTree (buildTree xs)
  where
    -- assuming that the list is in random order, (or else the tree is becoming unbalanced)
    buildTree xs = foldl' add' Null xs
    add' Null x = Leaf x
    add' (Leaf y) x
      | x <= y    = Node (Leaf x) y (Null)
      | otherwise = Node (Null) y (Leaf x)
    add' (Node lt y rt) x
      | x <= y    = Node (add' lt x) y rt
      | otherwise = Node lt y (add' rt x)
    
    collapseTree Null = []
    collapseTree (Leaf x) = [x]
    collapseTree (Node lt x rt) = (collapseTree lt) ++ [x] ++ (collapseTree rt)

cycleSort = undefined



    