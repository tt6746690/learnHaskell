{- http://learnyouahaskell.com/starting-out -}

double x = x + x 

-- if is an expression
doubleSmall x = if x > 100
    then x 
    else x * 2  -- else mandatory

-- convention to use func_name' to denote 
--      1. strict, i.e. non-lazy, version of function 
--      2. modified version 
doubleSmall' x = (if x > 100
    then x 
    else x * 2) + 1

-- function with no arg is a *name*
foo = "bar"


-- List 
numbers = [0,1,2,3,4,5]

-- cons operator  : 
aSmallCat = 'A':" small cat"

-- indexing operator !! 
thirdElem = numbers !! 3

-- (head tail ...)  ;   (init ... last)


-- Ranges
aRange = [1..23]
oddNumbers = [2,4..20] 

-- a infinite list 
first24multipliesof13 = take 24 [13,26..]

-- cycle: turns list into an infinite list of repeating list 
-- repeat: turns an element into infinite list 

-- List comprehension
--  * filtering by predicates
--  * draw from multiple lists
oddNumbers' = [x*2 | x <- [1..10], x*2 >= 12]
-- [12,14,16,18,20]
combinations = [x+y | x <- [1,2,3], y <- [10,20,30]]
-- [11,21,31,12,22,32,13,23,33]

-- combines list of adj and nouns
adjectives = ["happy", "sad"]
nouns = ["dog", "cat", "mice"]
wordCombinations = [a ++ " " ++ n | a <- adjectives, n <- nouns]


-- lengths 
length' xs = sum [1 | _ <- xs]
-- remove non uppercases 
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   


-- Tuples: heterogeneous, fixed length 
-- Pair: tuple of length 2 

-- (fst snd)
-- zip List List

--  rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2] 