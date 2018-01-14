
module Msgs exposing (..)

import Models exposing (Player)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Http
import Mouse exposing (Position)




type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
    | ChangeLevel Player Int
    | OnPlayerSave (Result Http.Error Player)
    | DragStart Position
    | DragAt Position
    | DragEnd Position


