-- the following function definition contains a syntax error:
sayHello :: IO ()
sayHello =
   do
   let name = "Alice"
   putStrLn "hello"
   putStrLn name

ask :: String -> IO ()
ask prompt =
  do
  putStrLn prompt
  line <- getLine
  if line == ""
    then ask (prompt ++ "!")
    else putStrLn ("you said: " ++ reverse line)

main :: IO ()
main =
  do
  sayHello
  ask "please say something"
