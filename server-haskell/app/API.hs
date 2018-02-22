{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

{-|
Module	: API
Description: Provides functionality for haskell based server
-}

module API where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty

-- | Represents a user
data User = User { userId :: Int,	-- ^ Stores userID
		   quote :: String 	-- ^ Stores info about user
		} deriving (Show, Generic)
instance ToJSON User
instance FromJSON User


-- | Operate with JSON : decode and encode user Mat (unfortunately, not used yet in practice in the app)
mat :: User
mat = User { userId = 1, quote = "Mateusz" }

-- | Operate with JSON : decode and encode user Gus
gus :: User
gus = User { userId = 2, quote = "Gustaw" }

-- | Returns array of users
allUsers :: [User]
allUsers = [mat, gus]

-- | Checks if received ID matches user's ID
matchesId :: Int -> User -> Bool
matchesId id user = userId user == id


-- | Starts the server and listens on  port 7000

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
