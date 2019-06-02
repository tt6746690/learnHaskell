{-
    Modules
        - a collection of functions, types, and typeclasses 
            - https://downloads.haskell.org/~ghc/latest/docs/html/libraries/
            - https://hoogle.haskell.org/
        - import 
            ghci> :m + Data.List Data.Map Data.Set  

            import Data.List                    -- import everything
            import Data.List (nub, sort)        -- import `nub` and `sort
            import Data.List hiding (nub)       -- import all but `nub`
            import qualified Data.List          -- use `Data.List.filter`
            import qualified Data.Map as M      -- use `M.filter`


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


    Data.Char
    Data.Map
    Data.Set

    Create a module
        - export function that becomes visible during `import`
        - Hierarchical module (corresponds to filesystem structure)
            Geometry/
                Sphere.hs
                Cuboid.hs

            # Sphere.hs
            module Geometry.Sphere
            (
                ...
            ) where

            # Cuboid.hs
            module Geometry.Cuboid
            (
                ...
            ) where
            import qualified Geometry.Sphere as Sphere

-}

module MyModule
(
    findKey'
) where

-- MyModule.findKey' :: Eq k => k -> [(k, v)] -> Maybe v


findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey' key [] = Nothing  
findKey' key ((k,v):xs) = if key == k  
                            then Just v  
                            else findKey' key xs  

