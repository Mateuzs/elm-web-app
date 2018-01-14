module Models exposing (..)



import RemoteData exposing (WebData)
import Mouse exposing (Position)








initialModel : Route -> Model
initialModel route =
    { players = RemoteData.NotAsked
    , route = route
    , position = Position 300 300
    , drag = Nothing

    }

-- Players Models




type alias Model =
       { players : WebData (List Player),
         route : Route,
         position : Position,
         drag : Maybe Drag
       }



type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }



-- Routing Models


type Route
    = HomeRoute
    | PlayersRoute
    | PlayerRoute PlayerId
    | DragBlockRoute
    | NotFoundRoute



-- DragBlock Models



type alias Drag =
    { start : Position
    , current : Position
    }

type alias Position =
  { x : Int
  , y : Int
  }
