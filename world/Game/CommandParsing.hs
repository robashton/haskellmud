module Game.CommandParsing where

--import Control.Applicative

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


parseCommand :: String -> Command
parseCommand _ = Command Take (Noun "axe")

