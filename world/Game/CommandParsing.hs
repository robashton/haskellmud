module Game.CommandParsing where

import Data.Char

data Direction = North
               | West
               | South
               | East
               deriving (Show, Eq)

type Noun = String

data Command = Take Noun
             | Move Direction
             | Nope
             deriving (Show, Eq)

data ParseResult t = ParseResult (t, String)
                   | Fail


isStopWord :: String -> Bool
isStopWord word = word `elem` [ "the", "is", "a" ]

consumeStopWords :: String -> String
consumeStopWords input =
    -- Note: We don't always have a space, deal with this.
    let (w, (' ':rest)) = break isSpace input
    in case isStopWord(w) of
         False -> input
         True -> consumeStopWords(rest)


parseNoun :: String -> (ParseResult Noun)
parseNoun input = ParseResult (consumeStopWords input, "")

parseDirection :: String -> (ParseResult Direction)
parseDirection input = case map toLower input of
                         "north" -> ParseResult (North, "")
                         "west" -> ParseResult (West, "")
                         "east" -> ParseResult (East, "")
                         "south" -> ParseResult (South, "")
                         _ -> Fail

parseCommand :: String -> Command
parseCommand input =
    let (v, (' ':rest)) = break isSpace input
    in case map toLower v of
         "take" -> case parseNoun rest of
                     ParseResult (n, _) -> Take n
                     _ -> Nope
         "go" -> case parseDirection rest of
                   ParseResult (d, _) -> Move d
                   _ -> Nope
         _ -> Nope



