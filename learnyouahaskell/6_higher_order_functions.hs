
{-
    Higher Order Function
    Function that either takes function as argument or return function

    function application: 
        * space has highest precedence
-}

-- Curried Function and Partial application

-- parentheses left associative by default
-- multThree :: (Num a) => a -> (a -> (a -> a))
multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z  

multTwoWithNine = multThree 9

{-
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred x = compare 100 x  
-}
-- equivalently
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100  

-- infix functions can be partially applied by using `sections`
--      section an infix function, surround it with parentheses and 
--      only supply a parameter on one side 
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)  
-- `(/10) 200` same as `200 / 10`

-- edge case: (-4)
--      * meant for representing negative numbers 
--      * use (subtract 4) instead
isUpperAlphanum :: Char -> Bool  
isUpperAlphanum = (`elem` ['A'..'Z'])  



-- Higher Order Function 
-- `->` is right associative
applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

--  applyTwice (3:) [1]                 -- [3,3,1]
--  applyTwice (++ " HAHA") "HEY"       -- [HEY HAHA HAHA]


zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys  

-- zipWith' (+) [4,2,5,6] [2,6,2,3]         -- [6,8,7,9]  
-- zipWith' max [6,3,2,1] [7,3,1,5]         -- [7,3,2,5]


flip' :: (a -> b -> c) -> (b -> a -> c)  
flip' f = g  
    where g x y = f y x  


flip'' :: (a -> b -> c) -> (b -> a -> c)  
flip'' f y x = f x y

-- flip' zip [1,2,3,4,5] "hello"    -- [('h',1),('e',2),('l',3),('l',4),('o',5)]  


-- map and filter 

map' :: (a -> b) -> [a] -> [b]  
map' _ [] = []  
map' f (x:xs) = f x : map f xs  


filter' :: (a -> Bool) -> [a] -> [a]  
filter' _ [] = []  
filter' p (x:xs)   
    | p x       = x : filter' p xs  
    | otherwise = filter' p xs  

-- lazy infinite list
largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
    where p x = x `mod` 3829 == 0  

-- takeWhile
--      takes a pred and a list, go from beginning of the list, 
--      return elements when pred true, stops at first element where pred false

firstWordOfSentence = takeWhile (/=' ') "elephants know how to party"


-- Collatz sequence 
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
    | even n = n : chain (n `div` 2)
    | odd n  = n : chain (n * 3 + 1)

numLongChain :: Int 
numLongChain = length (filter isLong (map chain [1..100]))
    where isLong xs = (length xs) > 15


-- Lambdas 
--      * `\args... -> body` 
--      * pattern matching allowed in lambda args, but 1 case only


numLongChain' :: Int 
numLongChain' = length (filter (\xs -> length xs > 15) (map chain [1..100]))
    where isLong xs = (length xs) > 15

-- can do 1 pattern matching in lambda 
patternInLambdaArgs = map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]  

-- defining a function with a lambda
flip''' :: (a -> b -> c) -> b -> a -> c  
flip''' f = \x y -> f y x  

{-
    (fold (acc x -> acc) acc list)
        * call binary lambda on each element of the list with accumulator and current element of the list 
        * can be used to implement any function that traverse the list once

    `foldl`: left fold   (\acc x -> ...)
        * `x` starts from beginning of the list
        * dont work on infinite list
    `foldr`: right fold  (\x acc -> ...)
        * `x` starts from right hand side of the list
        * maybe more efficient for building up list 
        * works on infinite lists, since always read beginning of list


    `foldl1` and `foldr1` 
        * same as `foldl` and `foldr` and assume start value is first/last element 

    `scanl` and `scanr` 
        * like `fold` but report all intermediate accumulator states in a list
-}

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0
-- \xs -> foldl (+) 0 xs

sum''' :: (Num a) => [a] -> a
sum''' = foldl1 (+)
-- \(x:xs) -> foldl (+) x xs


elem' :: (Eq a) => a -> [a] -> Bool  
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys  

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs 
-- `:` more efficient than `++` so foldr better than foldl



{-
    maximum' :: (Ord a) => [a] -> a  
    maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
    
    reverse' :: [a] -> [a]  
    reverse' = foldl (\acc x -> x : acc) []  
    
    product' :: (Num a) => [a] -> a  
    product' = foldr1 (*)  
    
    filter' :: (a -> Bool) -> [a] -> [a]  
    filter' p = foldr (\x acc -> if p x then x : acc else acc) []  
    
    head' :: [a] -> a  
    head' = foldr1 (\x _ -> x)  
    
    last' :: [a] -> a  
    last' = foldl1 (\_ x -> x)  
-}


{-
    Function application with `$`
        * application 
            * remove func application parenthesis
                * (f (g x))  <=> f $ g x
            * chain functions without adding parentheses to control eval order
            * can represent function application as a function 
        * Lowest precedence  
            * vs highest precedence for ' '
        * Right associative vs left associative for ' '
            * f $ g x   <=>  (f (g x))
            * f x y       <=> ((f x) y)
        * can be viewed as 'parentehsis to end of expression'
            sqrt (3 + 4 + 5)    <=>     sqrt $ 3 + 4 + 5
-}

($) :: (a -> b) -> a -> b  
f $ x = f x  


{-
    Function Composition 
        * creates new fucntion without specifying the arguments 
        * more concise 
            map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]  
            map (negate . abs) [5,-3,-6,7,-3,2,-19,24]  
        * right associative 
            f (g (z x))     <=>     (f . g . z) x
-}

(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x)  


{-
    -- lisp style
    oddSquareSum :: Integer  
    oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))           

    -- haskell style 
    oddSquareSum :: Integer  
    oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]  

    -- readable style 
    oddSquareSum :: Integer  
    oddSquareSum =   
        let oddSquares = filter odd $ map (^2) [1..]  
            belowLimit = takeWhile (<10000) oddSquares  
        in  sum belowLimit  
-}

