module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (PersonId, Route(..))
import UrlParser exposing (..)
import Html.Attributes exposing (class, href)


-- function responsible for routing through the views of the app.

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map HomeRoute (s "home")
        , map FamousPersonRoute (s "famousPeople" </> string)
        , map FamousPeopleRoute (s "famousPeople")
        , map DragBlockRoute (s "dragBlock")
        , map QuotesRoute (s "quotes")
        ]




parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of

        Just route ->  route

        Nothing -> NotFoundRoute




famousPeoplePath : String
famousPeoplePath =
    "#famousPeople"


famousPersonPath : PersonId -> String
famousPersonPath id =
    "#famousPeople/" ++ id


homePath : String
homePath =
    "#/home"

dragBlockPath : String
dragBlockPath =
    "#/dragBlock"

quotesPath : String
quotesPath =
    "#/quotes"

