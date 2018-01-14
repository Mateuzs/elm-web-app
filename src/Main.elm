module Main exposing (..)


import Commands exposing (fetchPlayers)
import Models exposing (Model, initialModel)
import Msgs exposing (..)
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import Mouse exposing (Position)



init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchPlayers )



subscriptions : Model -> Sub Msg
subscriptions model =
  case model.drag of
    Nothing ->
      Sub.none

    Just _ ->
      Sub.batch [ Mouse.moves DragAt, Mouse.ups DragEnd ]



main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
