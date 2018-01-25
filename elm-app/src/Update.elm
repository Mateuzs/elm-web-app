module Update exposing (..)

import Msgs exposing (..)
import Models exposing (Model, FamousPerson, Drag)
import Routing exposing (parseLocation)
import Commands exposing (..)
import RemoteData
import DragBlock.DragBlock exposing (..)
import Random



-- function that uptades information inside models


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of

        Msgs.OnFetchFamousPeople response ->
            ( { model | famousPeople = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Msgs.DragStart position ->
            ( positionUpdateHelp msg model, Cmd.none )

        Msgs.DragAt position ->
            ( positionUpdateHelp msg model, Cmd.none )

        Msgs.DragEnd position ->
            ( positionUpdateHelp msg model, Cmd.none )

        Msgs.GetNumber ->
            (model, Random.generate GetQuote (Random.int 1 10))

        Msgs.GetQuote x ->
            ( model,  fetchQuote x)

        Msgs.OnFetchQuote response ->
            ( {model | quote = response}, Cmd.none )






-- update position in dragBlock


positionUpdateHelp : Msg -> Model -> Model
positionUpdateHelp msg model =
  case msg of
    DragStart xy ->
     Model model.famousPeople model.route model.position (Just (Drag xy xy) ) model.quote

    DragAt xy ->
      Model model.famousPeople model.route model.position (Maybe.map (\{start} -> Drag start xy) model.drag) model.quote

    DragEnd _ ->
      Model model.famousPeople model.route (getPosition model) Nothing model.quote

    _ -> model

