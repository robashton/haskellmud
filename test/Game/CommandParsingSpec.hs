module Game.CommandParsingSpec where

import SpecHelper

spec :: Spec
spec = do
    describe "Text.Liquid.Parse" $ do
        context "Simple text" $ do
            it "parses exactly as-is" $ do
                let content = "Some simple text"
                parseCommand content `shouldBe` content ++ "Parsed"

main :: IO ()
main = hspec spec
