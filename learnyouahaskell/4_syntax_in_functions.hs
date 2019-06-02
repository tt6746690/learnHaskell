
-- Pattern Matching
--      - over the arguments to functions
--      - matching in order of listing

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)


addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors a b = (fst a + fst b, snd a + snd b) 

-- use pattern matching to simplify
addVectors' (x1,y1) (x2,y2) = (x1+x2,y1+y2)


first :: (a, b, c) -> a  
first (x, _, _) = x  
second :: (a, b, c) -> b  
second (_, y, _) = y  
third :: (a, b, c) -> c  
third (_, _, z) = z  

-- patterns with `:` only match against lists of length 1 or more

head' :: [a] -> a 
head' [] = error "Cant call head on empty list"
head' (x:_) = x  -- binding >1 variable requires wrapping pattern inside parenthesis


length' :: (Num b) => [a] -> b 
length' [] = 0 
length' (_:l) = 1 + length' l


sum' :: (Num a) => [a] -> a 
sum' [] = 0 
sum' (x:l) = x + sum' l

-- name@pattern: `name` has bound value matching `pattern`
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  

{-

Guards: 
     - cases evaluated in order, integrates well with pattern
     - if/else statement for arguments
     - `otherwise = True`

 where: 
    - syntactic construct
    - binds names to expression at end of function
    - visible across function body and guards
    
-}

myCompare :: (Ord a) => a -> a -> Ordering 
a `myCompare` b 
    | a > b      = GT 
    | a == b     = EQ 
    | otherwise  = LT

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where   bmi = weight / height ^ 2  
            (skinny, normal, fat) = (18.5, 25.0, 30.0)

{-
    let <bindings> in <expressions>
        - `where` is syntax, `let` is expression, so can appear almost anywhere
            - in Preclude, visible globally cross interactive session
            - in list comprehension (visible in output function, i.e. before `|` and all predicates & sections after binding)
                calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
                calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
            - in tuple 
                (let a = 100 in a*2, let a = 200 in a)  -- (200, 200)
        - binds names to expression anywhere, however cannot be used across guards (use `where` instead)
        - visible only locally in <expression>
-}


cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  


{-
    Case expressions

    case expr of pattern -> result 
                 pattern -> result 
                 ...

        - `expr` matched against
        - pattern matching on parameters in function definition (guards) is syntactic sugar for case expression
    
-}
head'' :: [a] -> a  
head'' xs = case xs of []    -> error "No head for empty lists!"  
                       (x:_) -> x  

-- equiv to 
head''' [] = error " No head for empty list!"
head''' (x:_) = x