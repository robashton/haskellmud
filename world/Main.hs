-- There shouldn't be too much code in here
-- I need to push stuff out into a library and whatever

module Main where

import Game.CommandParsing

main :: IO()
main = putStrLn $ parseCommand "Hello World"


