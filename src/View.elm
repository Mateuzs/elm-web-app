module View exposing (..)

import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model, PersonId)
import FamousPeople.ListView
import FamousPeople.InfoView
import DragBlock.DragBlock
import Quotes.QuotesView
import RemoteData
import Home.Home
import Mouse exposing (Position)




-- main view function, generates view of the webpage

view : Model -> Html Msg
view model =
    div []
        [ page model ]


-- function checks which view is supposed to be shown.

page : Model -> Html Msg
page model =
    case model.route of
        Models.FamousPeopleRoute ->
            FamousPeople.ListView.view model.famousPeople

        Models.FamousPersonRoute id ->
            famousPersonInfoPage model id

        Models.HomeRoute ->
            Home.Home.view

        Models.DragBlockRoute ->
            DragBlock.DragBlock.view model

        Models.QuotesRoute ->
            Quotes.QuotesView.view model

        Models.NotFoundRoute ->
            notFoundView




famousPersonInfoPage : Model -> PersonId -> Html Msg
famousPersonInfoPage model personId =
    case model.famousPeople of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success famousPeople ->
            let
                maybeFamousPerson =
                    famousPeople
                        |> List.filter (\person -> person.id == personId)
                        |> List.head
            in
                case maybeFamousPerson of
                    Just famousPerson ->
                        FamousPeople.InfoView.view famousPerson

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
