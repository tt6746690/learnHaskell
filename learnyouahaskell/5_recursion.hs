

-- Recursion 

maximum' :: (Ord a) => [a] -> a 
maximum' [] = error "maximum of empty list" 
maximum' [x] = x 
maximum' (x:xs) = max x (maximum' xs)

-- specify i as Ord and Num because need to do `<=` and `-` 
replicate' :: (Ord i, Num i) => i -> a -> [a]
replicate' n x
    | n <= 0        = [] 
    | otherwise     = x : (replicate' (n-1) x)

-- Take returns empty list if input is empty or want to take 0 items 
take' :: (Ord i, Num i) => i -> [a] -> [a]
take' n _
    | n <= 0    = []
take' _ []      = [] 
take' n (x:xs)  = x : (take' (n-1) xs)


-- repeat returns an infinite list 
repeat' :: a -> [a]
repeat' x = x : (repeat' x)


zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = [] 
zip' (x:xs) (y:ys) = (x,y) : (zip' xs ys)


elem' :: (Eq a) => a -> [a] -> Bool  
elem' a [] = False  
elem' a (x:xs)  
    | a == x    = True  
    | otherwise = a `elem'` xs   


quicksort :: (Ord a) => [a] -> [a] 
quicksort [] = []
quicksort (x:xs) = 
    let lowerSorted = quicksort [a | a <- xs, a <= x] 
        upperSorted = quicksort [a | a <- xs, a > x] 
    in  lowerSorted ++ [x] ++ upperSorted 