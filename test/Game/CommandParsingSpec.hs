module Game.CommandParsingSpec where

import SpecHelper

spec :: Spec
spec = do
    describe "Game.CommandParsing.parseCommand" $ do
      context "Simple take" $ do
        it "parses a take" $ do
          let content = "take axe"
            in parseCommand content `shouldBe` (Command Take (Noun "axe"))

main :: IO ()
main = hspec spec
