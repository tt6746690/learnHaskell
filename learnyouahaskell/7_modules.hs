{-
    module
    - a collection of related functions, types, and typeclasses
        - i.e. `Prelude` module imported by default
-}
module Main where

import Control.Exception
import Data.List
import Data.Char
-- prefixing functions to avoid name-space clashes
-- `Map.filter` vs. `filter` (from Prelude)
import qualified Data.Map as Map

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub


{-
    Data.List

    intersperse :: a -> [a] -> [a]
    intercalate :: [a] -> [[a]] -> [a]
        -- concat . intersperse
    transpose :: [[a]] -> [[a]]
    concat :: Foldable t => t [a] -> [a]
    concatMap :: Foldable t => (a -> [b]) -> t a -> [b]
    and/or :: Foldable t => t Bool -> Bool
    any/all :: Foldable t => (a -> Bool) -> t a -> Bool
    iterate :: (a -> a) -> a -> [a]
        -- f x = [x, f x, f . f x, ...]
    splitAt :: Int -> [a] -> ([a], [a])
    takeWhile :: (a -> Bool) -> [a] -> [a]
        -- keep item while predicate true, discard rest of list once predicate yield false
        -- works on infinite list better than `filter`, which never finishes
    dropWhile :: (a -> Bool) -> [a] -> [a]
        -- drops item while predicate true, keep rest of list once predicate yield false
    span :: (a -> Bool) -> [a] -> ([a], [a])
        -- first item returned same as return value of `takeWhile`
        -- second item returned is the rest of the list
    sort :: Ord a => [a] -> [a]
    group :: Eq a => [a] -> [[a]]
        -- returns a list of lists s.t. concat of result is equal to the argument 
        -- and each sublists ocntains only equal elements
    inits :: [a] -> [[a]]
    tails :: [a] -> [[a]]
    isInfixOf :: Eq a => [a] -> [a] -> Bool
        -- true if first list is contained entirely in second list
    isPrefixOf :: Eq a => [a] -> [a] -> Bool
    isSuffixOf :: Eq a => [a] -> [a] -> Bool
    partition :: (a -> Bool) -> [a] -> ([a], [a])
        -- partition p xs = (filter p xs, filter (not . p) xs)
    find :: Foldable t => (a -> Bool) -> t a -> Maybe a
    elemIndex :: (Eq a) => a -> [a] => Maybe Int
    elemIndices :: (Eq a) => a -> [a] => [Int]
    findIndex :: (Eq a) => (a -> Bool) -> [a] -> Maybe Int
    zip :: [a] -> [b] -> [(a, b)]
    zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
        -- generalizes `zip` 
        -- zipping with a function, instead of a tupling function
    lines :: String -> [String]
    unlines :: [String] -> String
    words :: String -> [String]
    unwords :: [String] -> String
    delete :: Eq a => a -> [a] -> [a]
        -- removes first occurrence of `x` from list argument
    (\\) :: Eq a => [a] -> [a] -> [a] infix 5
    insert :: Ord a => a -> [a] -> [a]
        insert an element into the last position in a list s.t. its still less than or equal to the next element
    generic{Take, Drop, SplitAt, Index, Replicate}
        -- Use Integral instead ...
    {nub, delete, union, intersect, group}By
        -- Generalized function that uses lambda to test for equality instead of `==`
-}


-- -- use group to find occurences of each element in list 
-- x = map (\l@(x:xs) -> (x, length l)) . group . sort $ [1,2,2,3,3,3,4,4,4,4]
-- -- x == [(1,1),(2,2),(3,3),(4,4)]


main :: IO () 
main = do
    let x = 1
    assert True "s"


-- {-
--     Data.Char
    
--     isSpace :: Char -> Bool
--         -- and other preicates ...

-- -}

-- assert (all isAlphaNum "bobby") "x"