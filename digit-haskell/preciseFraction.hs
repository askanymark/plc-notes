import           Data.Ratio

main = print (sum_fracts 1000)

sum_fracts n
    | (n == 0) = 1
    | otherwise = (1%n) + sum_fracts (n - 1)
