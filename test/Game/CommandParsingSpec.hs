module Game.CommandParsingSpec where

import SpecHelper

spec :: Spec
spec = do
    describe "Game.CommandParsing.parseCommand" $ do
      context "Simple statements" $ do
        it "parses a take" $ do
          let content = "take axe"
            in parseCommand content `shouldBe` (Take "axe")
        it "parses a Take" $ do
          let content = "Take axe"
            in parseCommand content `shouldBe` (Take "axe")
        it "parses a go" $ do
          let content = "go north"
            in parseCommand content `shouldBe` (Move North)

main :: IO ()
main = hspec spec
