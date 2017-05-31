main = print (factorial 1000)
factorial n
    | (n == 0) = 1
    | otherwise = n * factorial (n - 1)
