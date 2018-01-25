{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module API where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty


data User = User { userId :: Int, quote :: String } deriving (Show, Generic)
instance ToJSON User
instance FromJSON User


-- operate with JSON : decode and encode (unfortunately, not used yet in practice in the app)
mat :: User
mat = User { userId = 1, quote = "Mateusz" }

gus :: User
gus = User { userId = 2, quote = "Gustaw" }

allUsers :: [User]
allUsers = [mat, gus]

matchesId :: Int -> User -> Bool
matchesId id user = userId user == id


-- starts the server and listens on  port 7000

startServer = do

  putStrLn "Starting Server..."
  scotty 7000 $ do

       get "/:famousPeople" $ do
          fileName <- param "famousPeople"
          setHeader "Content-Type" "application/json; charset=utf-8"
          setHeader "Access-Control-Allow-Origin" "*"
          file $  "app/Database/" ++ fileName

       get "/Quotes/:number" $ do
          randomNumber <- param "number"
          setHeader "Content-Type" "application/json; charset=utf-8"
          setHeader "Access-Control-Allow-Origin" "*"
          file $ "app/Database/Quotes/" ++ randomNumber
