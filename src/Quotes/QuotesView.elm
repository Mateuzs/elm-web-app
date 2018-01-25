module Quotes.QuotesView exposing (..)


import Html exposing (..)
import Html.Attributes exposing (class,href,value)
import Msgs exposing (Msg)
import Routing exposing (homePath)
import Models exposing (Model,Quote)
import Html.Events exposing (onClick)
import RemoteData

view : Model -> Html Msg
view model  =
    div []
        [ nav,
          body model
        ]


nav :  Html Msg
nav  =
    div [ class "navBar" ]
        [div [class "navBarFont"] [homeBtn] ]



body : Model -> Html Msg
body model =  div [class "img"] [
                    div [class "quoteBlock"] [
                        div [class "quoteTitle"] [text ("Chuck Norris Quotes!")],
                        div [class "quoteContent1"] [text("C'mon! Hit the button!")],
                        div [class "quoteContent1"] [div [class "content1"] [getQuotesBtn]],
                        div [class "quoteContent2"] [  showQuote model ]
          ]
        ]







-- support function to handle with quote div
-- it parses RemoteData states

showQuote : Model -> Html Msg
showQuote model =
      case model.quote of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Success quote ->
            text quote.quote

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Failure err ->

            text (toString err)






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



getQuotesBtn :  Html.Html Msg
getQuotesBtn  =
  let
    message =
        Msgs.GetNumber
  in
      a [ class "quoteBtn fa fa-rocket fa-2x" , onClick message]
        [ i [ class "   " ] [], text "Get a Quote!" ]



