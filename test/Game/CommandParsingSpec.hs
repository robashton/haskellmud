module Game.CommandParsingSpec where

import SpecHelper

spec :: Spec
spec = do
    describe "Text.Liquid.Parse" $ do
        context "Simple text" $ do
            it "parses exactly as-is" $ do
                let content = "take axe"
                let expected = Command Take (Noun "axe")
                parseCommand content `shouldBe` expected

main :: IO ()
main = hspec spec
