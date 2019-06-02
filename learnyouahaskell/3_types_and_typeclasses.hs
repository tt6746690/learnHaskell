{-
    Types 

    Some points
        * :t examines type of expression 
        * Types are written capitalized
        * expr :: type
        * [Char] is String

    primitives:
        | Int (bounded)
        | Integer 
        | Float 
        | Double 
        | Bool 
        | Char

    Type Variables 
        * generic type, enables polymorphic functions, i.e.
            head :: [a] -> a  
            where `a` is a type variable

    Typeclasses 
        * an interface for some behavior 
        * type is a part of typeclass when it implements the behavior of the typeclass, i.e. 
            (==) :: (Eq a) => a -> a -> Bool
        * class constraints (before `=>`)
            + (Eq a) specifies that type of `a` must be a member of `Eq` typeclass
            + note any type which makes sense to test for equality __is__ a member of `Eq` class


    Type Annotations
        * explicitly saying what the type of expression should be
        + for functions whose type variable is parameterized by the return variable

    basic typeclasses:
        * Eq:  Comparison
            * `==` `/=` 
        * Ord: Ordering
            * `>` `<` `>=` `<=` 
        * Show: ~
            * can be represented as strings 
        * Read: 
            * read :: (Read a) => String -> a
            * takes a string and returns a type 
            read "True" || False    -- True
        * Enum: 
            * sequentially ordered, can be enumerated and used in list/ranges
            * defines successor `succ` and predecesors `pred`
            * `()`, `Bool`, Ordering, Int, Double, ...
        * Bounded: 
            * have upper and lower bound 
            > minBound :: Int    -- -2147483648
        * Num:
            * numeric, act like a number ... 
            > 20 :: (Num t) => t      -- 20 is a polymorphic constant
            20 :: Int   -- 20
            20 :: Float -- 20.0

            > (*) :: (Num a) => a -> a -> a  
            5 * (6 :: Int)    -- OK, since 5 act polymorphically as Int
        * Integral:     
            * subset of Num, incldues only integral numbers 
            * `Int` `Integer`
        * Floating: 
            * `Float` `Double`


    Upcasting: 
    > fromIntegral :: (Num b, Integral a) => a -> b
    > length :: Foldable t => t a -> Int

    (length [1,2,3]) + 3.2              -- Error! Int + Float 
    fromIntegral (length [1,2,3]) + 3.2 -- OK

-}
