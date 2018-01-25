module FamousPeople.InfoView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Msgs exposing (Msg)
import Models exposing (FamousPerson)
import Html.Events exposing (onClick)
import Routing exposing (famousPeoplePath)


-- main view function generates a view from given model

view : FamousPerson -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]

-- generates the navbar

nav : FamousPerson -> Html Msg
nav model =
         div [class "navBar"] [
                div [ class "navBarFont" ] [listBtn]]


-- generates  body of the webpage

form : FamousPerson -> Html Msg
form famousPerson =

    div [class "img"]
        [div [ class "bodyBlock" ]
          [  div [class "title"]
                 [ text (famousPerson.name ++ " " ++ famousPerson.surname)]
            ,div [class "content"]
                 [text famousPerson.description]
          ]]



-- list button in the navbar, redirecting us back to the list

listBtn : Html Msg
listBtn =
    a
        [ class "btn navBarBtn regular"
        , href famousPeoplePath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
