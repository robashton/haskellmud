module Game.CommandParsing where

import Data.Char

data Verb = Take
          | Go
          | Move
          deriving (Show, Eq)

data Direction = North
               | West
               | South
               | East
               deriving (Show, Eq)

data Noun = Noun String
          deriving (Show, Eq)

data Command = Command { verb :: Verb,
                         noun :: Noun }
                         deriving (Show, Eq)

parseVerb :: String -> Verb
parseVerb v =
    case v of
      "take" -> Take
      "go" -> Go
      "move" -> Move
      _ -> Take

parseNoun :: String -> Noun
parseNoun n = Noun n

parseCommand :: String -> Command
parseCommand input =
    let (v, (' ':rest)) = break isSpace input
    in Command (parseVerb v) (parseNoun rest)

