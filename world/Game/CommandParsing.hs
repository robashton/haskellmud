module Game.CommandParsing where

--import Control.Applicative

data Verb = Take
          | Go
          | Move
          deriving Show

data Direction = North
               | West
               | South
               | East
               deriving Show

data Noun = Noun String
          deriving Show

data Command = Command { verb :: Verb,
                         noun :: Noun }

parseCommand :: String -> Command
parseCommand _ = Command Take (Noun "Axe")

