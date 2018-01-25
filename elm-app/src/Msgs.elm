
module Msgs exposing (..)

import Models exposing (FamousPerson, Quote, Model)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Http
import Mouse exposing (Position)



-- special type for variety of messages used in the app

type Msg
    = OnFetchFamousPeople (WebData (List FamousPerson))
    | OnLocationChange Location
    | DragStart Position
    | DragAt Position
    | DragEnd Position
    | GetNumber
    | GetQuote Int
    | OnFetchQuote (WebData (Quote))


