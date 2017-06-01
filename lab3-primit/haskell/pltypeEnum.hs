module Main where

import           Data.Char (toUpper)
import           System.IO (BufferMode (..), hSetBuffering, stdout)

main =
    do
    initialiseIO
    putStrLn $ "known PL types = " ++ show allPLTypes
    plType <- getElement "programming language type"
    putStrLn $ show plType ++ " example language: " ++ show (plType2PL plType)

initialiseIO =
    do
    hSetBuffering stdout NoBuffering
        -- ensure any console output is shown asap

data PL = JAVA | C | ADA | PYTHON | LISP | HASKELL | PROLOG
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)
data PLType = OO | PROCEDURAL | FUNCTIONAL | LOGICAL
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)

allPLs :: [PL] -- ie it is a list of PL elements
allPLs = [minBound .. maxBound]
allPLTypes :: [PLType] -- it is a list of PLType elements
allPLTypes = [minBound .. maxBound]

pl2PLType JAVA    = OO
pl2PLType C       = PROCEDURAL
pl2PLType ADA     = PROCEDURAL
pl2PLType PYTHON  = OO
pl2PLType LISP    = FUNCTIONAL
pl2PLType HASKELL = FUNCTIONAL
pl2PLType PROLOG  = LOGICAL

plType2PL OO         = JAVA
plType2PL PROCEDURAL = ADA
plType2PL FUNCTIONAL = HASKELL
plType2PL LOGICAL    = PROLOG

{-
  `getElement'
  queries the user for one element until the user types something
  that can be interpreted as the correct type of element (eg integer)
-}
getElement elementTypeName =
    do
    hSetBuffering stdout NoBuffering -- print to console in real time, not in batches
    putStr ("Input one " ++ elementTypeName ++ ": ") -- print the prompt
    line <- getLine -- get whatever user types as a string
    case parseElement line of
         Just element ->
            do
            return element
         Nothing ->
            do
            putStrLn ("Invalid " ++ elementTypeName ++ ", try again")
            getElement elementTypeName -- try again - using recursion

parseElement line =
    case reads line of
        [] -> -- no valid interpretation of the line as an element ([] = the empty list)
            Nothing
        -- [pattern 2:]
        ((e,_) : _) -> -- found at least one interpretation, call it "n"
            Just e -- type of e is derived from context
                   -- where getElement is used
