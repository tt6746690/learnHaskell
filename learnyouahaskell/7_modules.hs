

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

