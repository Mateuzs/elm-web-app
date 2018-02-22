
module Models exposing (..)


--necessary modules

import RemoteData exposing (WebData)
import Mouse exposing (Position)



-- this is initial model which is loaded when we connect to the server

initialModel : Route -> Model
initialModel route =
    { famousPeople = RemoteData.NotAsked
    , route = route
    , position = Position 300 300
    , drag = Nothing
    , quote =  RemoteData.NotAsked
    }




-- famousPeople Models


type alias Model =
       { famousPeople : WebData (List FamousPerson),
         route : Route,
         position : Position,
         drag : Maybe Drag,
         quote : WebData Quote
       }


type alias PersonId = String


type alias FamousPerson =
    { id : PersonId
    , name : String
    , surname : String
    , age : String
    , profession : String
    , description : String
    }


type alias Quote =
      {quote: String}




-- Routing Models


type Route
    = HomeRoute
    | FamousPeopleRoute
    | FamousPersonRoute PersonId
    | DragBlockRoute
    | QuotesRoute
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
