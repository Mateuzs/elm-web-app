module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (PlayerId, Route(..))
import UrlParser exposing (..)
import Html.Attributes exposing (class, href)



matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map HomeRoute (s "home")
        , map PlayerRoute (s "players" </> string)
        , map PlayersRoute (s "players")
        , map DragBlockRoute (s "dragBlock")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of

        Just route ->  route

        Nothing -> NotFoundRoute




playersPath : String
playersPath =
    "#players"


playerPath : PlayerId -> String
playerPath id =
    "#players/" ++ id


homePath : String
homePath =
    "#/home"

dragBlockPath : String
dragBlockPath =
    "#/dragBlock"

