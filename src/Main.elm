module Main exposing (..)


import Commands exposing (fetchFamousPeople)
import Models exposing (Model, initialModel)
import Msgs exposing (..)
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import Mouse exposing (Position)


-- this is initial function which starts when we conntect to the
-- server.

init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchFamousPeople )


-- function for special tasks, for example watching mouse
-- movement

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
