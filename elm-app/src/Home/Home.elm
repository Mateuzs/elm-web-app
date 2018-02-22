
module Home.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class,href)
import Msgs exposing (Msg)
import Routing exposing (homePath,famousPeoplePath,dragBlockPath, quotesPath)






--- generates view of the page : two main parts navBar and body

view : Html Msg
view   =
    div []
        [ nav,
          body
        ]




-- subunctions supporting the view function

nav :  Html Msg
nav  =
    div [ class "navBar" ]
        [div [class "navBarFont"]
             [famousPeopleBtn, dragBlockBtn, quotesBtn]
        ]



body : Html Msg
body =
    div  [class "img"]
    [div [class "homeBlock"]
         [ div [class "textHomeBlock"] [text ("Hello everyone ! :) this is a project !"
         ++ "\n We've added here some views with features to"
         ++ " show You that creating a website with functional languages"
         ++ " is really comfortable and funny! We've used Elm and Haskell. Enjoy! ")
         ]]]





--button functions on the view,

famousPeopleBtn : Html Msg
famousPeopleBtn =
    a
        [ class "btn navBarBtn regular"
        , href famousPeoplePath
        ]
        [ i [ class "fa fa-chevron-right mr1" ] [], text "Famous People!" ]


dragBlockBtn : Html Msg
dragBlockBtn =
    a
        [ class "btn navBarBtn regular"
        , href dragBlockPath
        ]
        [ i [ class "fa fa-chevron-right mr1" ] [], text "Drag Block" ]


quotesBtn : Html Msg
quotesBtn =
    a
        [ class "btn navBarBtn regular"
        , href quotesPath
        ]
        [ i [ class "fa fa-chevron-right mr1" ] [], text "Quotes!" ]



