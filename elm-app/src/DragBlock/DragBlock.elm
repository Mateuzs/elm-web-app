module DragBlock.DragBlock exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Decode
import Mouse exposing (Position)
import Models exposing (Model)
import Msgs exposing (..)
import Routing exposing (homePath)


(=>) : a -> b -> ( a, b )
(=>) = (,)

view : Model -> Html Msg
view model =
  div []
  [
    nav,
    body model
  ]



nav : Html Msg
nav =
    div [ class "navBar noselect" ]
        [ div [ class " navBarFont" ] [ homeBtn ] ]




body : Model -> Html Msg
body model =  let
    realPosition =
      getPosition model

 in
  div [class "img"]

    [ div
      [ class "dragBlock" , onMouseDown
      , style
          [
           "left" => px realPosition.x
          , "top" => px realPosition.y
          ]
      ]
      [ text "Drag Me!"
      ]]



px : Int -> String
px number =
  toString number ++ "px"


getPosition : Model -> Position
getPosition {position, drag} =
  case drag of
    Nothing ->
      position

    Just {start,current} ->
      Position
        (position.x + current.x - start.x)
        (position.y + current.y - start.y)


onMouseDown : Attribute Msg
onMouseDown =
  on "mousedown" (Decode.map DragStart Mouse.position)



homeBtn : Html.Html Msg
homeBtn =
  let
    path = homePath
  in
      a
            [ class "navBarBtn btn regular"
            , href path
            ]
            [ i [ class "fa fa-home" ] [], text "Home" ]


