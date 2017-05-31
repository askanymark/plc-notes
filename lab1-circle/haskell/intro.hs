import Text.Printf
-- a library module

import Included
-- separately compiled user module

main :: IO ()
main =
  -- level of indentation is important
  do
  -- parameter call:
  putStrLn (printf "hello %d" (123 :: Int))

  putStrLn "hello"

  let name = "Alice"
  putStrLn name

  let name2 = putStrLn "Bob" -- in Lisp: '(print "Bob")
  -- putStrLn name2 -- Couldn't match type ...; Expected type: String; Actual type: IO ()
  name2 -- in Lisp: eval name2

  let n = 1 + 2 :: Int
  putStrLn (toString n)

  -- "if" has a special syntax but otherwise a typed version of Lisp's "if":
  putStrLn (if name /= "" then name else "noname")
    -- "then" and "else" have to return values of the same type

  -- cannot leave out the "else" branch:
  if name /= "" then putStrLn name else pure ()
    -- pure = no effect, just return the given value
    -- () is Haskell's version of null
    -- "then" and "else" have to return values of the same type

  -- sequencing multiple expressions:
  if name /= "" then do { putStrLn "hello:"; putStrLn name } else pure ()

  -- a program can be treated as data:
  let m = 1 :: Int
  let myprogram = putStrLn (toString (1 + m))
  -- but, unlike in Lisp, it is compiled, thus:
  --   it cannot refer to an undefined variable "m"
  --   and it cannot be printed:
  -- putStrLn (toString myprogram)
      -- compiler error: "No instance for (Show (IO ()))"
      -- ie there is no method to print a program
  -- like in Lisp, it can be executed:
  myprogram -- in Lisp: (eval myprogram)
-- end of indented block, ie end of the body of function main

  let a = 1 -- unlike in Lisp, we cannot pass "a" to an included module
  putStrLn (toString i) -- use constant "i" defined in another file

-- define a Java-friendly synonym for better readability:
toString :: (Show t) => t -> String
toString = show
