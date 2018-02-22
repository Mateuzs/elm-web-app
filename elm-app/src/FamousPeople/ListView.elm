module FamousPeople.ListView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class,href)
import Msgs exposing (Msg)
import Models exposing (FamousPerson)
import RemoteData exposing (WebData)
import Routing exposing (famousPersonPath, homePath)


-- main view function generates a view from given model

view : WebData (List FamousPerson) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


-- this function react on the proper answer from RemoteData and informs user about the state on the webpage

maybeList : WebData (List FamousPerson) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success famousPeople ->
            list famousPeople

        RemoteData.Failure error ->
            text (toString error)


-- generates the navbar

nav : Html Msg
nav =
    div [ class "navBar" ]
        [ div [ class " navBarFont" ] [ homeBtn ] ]



-- generates a table on the webpage

list : List FamousPerson -> Html Msg
list famousPeople =


   div [class "img"]
    [div [class "listBlock"]
        [ table [class "table"]
            [ thead [class "headField"]
                [ tr []
                    [ th [class "headField"] [ text "Id" ]
                    , th [class "headField"] [ text "Name" ]
                    , th [class "headField"] [ text "Surname" ]
                    , th [class "headField"] [ text "Age" ]
                    , th [class "headField"] [ text "Profession" ]
                    , th [class "headField"] [ text "Info   " ]
                    ]
                ]
            , tbody [] (List.map famousPersonRow famousPeople)
            ]
        ]]

-- generate single row in the table

famousPersonRow : FamousPerson -> Html Msg
famousPersonRow famousPerson =
    tr [class "listField"]
        [ td [class "listField"] [ text famousPerson.id ]
        , td [class "listField"] [ text famousPerson.name ]
        , td [class "listField"] [ text (famousPerson.surname) ]
        , td [class "listField"] [ text (famousPerson.age) ]
        , td [class "listField"] [ text (famousPerson.profession) ]
        , td [class "listFieldAction"] [infoBtn famousPerson]
        ]




-- a button which redirecting us to the next view

infoBtn : FamousPerson -> Html.Html Msg
infoBtn famousPerson =
    let
        path =
            famousPersonPath famousPerson.id
    in
        a
            [ class "btn editBtn regular"
            , href path
            ]
            [ i [ class "fa fa-info-circle mr1" ] [], text "Info" ]




-- home button in the navbar

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
