
module Home.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class,href)
import Msgs exposing (Msg)
import Routing exposing (homePath,playersPath,dragBlockPath)

view : Html Msg
view   =
    div []
        [ nav,
          body
        ]


nav :  Html Msg
nav  =
    div [ class "navBar" ]
        [div [class "navBarFont"] [playersBtn, dragBlockBtn] ]



body : Html Msg
body =
    div [class "homeBlock"]
    [ div [class "textHomeBlock"] [text ("Hello everyone ! :) this is a project !"
         ++ "\n We've added here some views with feathers to"
         ++ " show You that creating a website in functional language"
         ++ " is possible! ")
    ]]










playersBtn : Html Msg
playersBtn =
    a
        [ class "btn navBarBtn regular"
        , href playersPath
        ]
        [ i [ class "fa fa-chevron-right mr1" ] [], text "Players" ]


dragBlockBtn : Html Msg
dragBlockBtn =
    a
        [ class "btn navBarBtn regular"
        , href dragBlockPath
        ]
        [ i [ class "fa fa-chevron-right mr1" ] [], text "Drag Block" ]
