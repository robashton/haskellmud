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
        it "parses when the noob user has a 'the' in the sentence" $ do
          let content = "take the axe"
            in parseCommand content `shouldBe` (Take "axe")
        it "parses when there is a multi-word thing needing pickingp" $ do
          let content = "take pinkie pie"
            in parseCommand content `shouldBe` (Take "pinkie pie")

main :: IO ()
main = hspec spec
