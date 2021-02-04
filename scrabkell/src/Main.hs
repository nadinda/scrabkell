{-# LANGUAGE OverloadedStrings #-}

module Main where

import Reflex.Dom
import Data.Text

messenger :: Text -> Text
messenger "" = "It's good to have you with us"
messenger a  = a

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  putStrLn "What is your name?"
  line <- getLine 
  putStrLn $ "Hello, " <> line
  mainWidget $ el "div" $ do
     text $  "Welcome to Reflex, " <> pack line
     t <- inputElement def
     text " "
     let message = messenger <$> _inputElement_value t
     dynText message
     

