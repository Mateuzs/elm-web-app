module Update exposing (..)

import Msgs exposing (..)
import Models exposing (Model, Player, Drag)
import Routing exposing (parseLocation)
import Commands exposing (savePlayerCmd)
import RemoteData
import DragBlock.DragBlock exposing (..)



-- uptade depends on the message


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of

        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Msgs.ChangeLevel player howMuch ->
            let
                updatedPlayer =
                    { player | level = player.level + howMuch }
            in
                ( model, savePlayerCmd updatedPlayer )

        Msgs.OnPlayerSave (Ok player) ->
            ( updatePlayer model player, Cmd.none )

        Msgs.OnPlayerSave (Err error) ->
            ( model, Cmd.none )

        Msgs.DragStart position ->
            ( positionUpdateHelp msg model, Cmd.none )

        Msgs.DragAt position ->
            ( positionUpdateHelp msg model, Cmd.none )

        Msgs.DragEnd position ->
            ( positionUpdateHelp msg model, Cmd.none )





-- uptade player data

updatePlayer : Model -> Player -> Model
updatePlayer model updatedPlayer =
    let
        pick currentPlayer =
            if updatedPlayer.id == currentPlayer.id then
                updatedPlayer
            else
                currentPlayer

        updatePlayerList players =
            List.map pick players

        updatedPlayers =
            RemoteData.map updatePlayerList model.players
    in
        { model | players = updatedPlayers }




-- update position in dragBlock




positionUpdateHelp : Msg -> Model -> Model
positionUpdateHelp msg model =
  case msg of
    DragStart xy ->
     Model model.players model.route model.position (Just (Drag xy xy))

    DragAt xy ->
      Model model.players model.route model.position (Maybe.map (\{start} -> Drag start xy) model.drag)

    DragEnd _ ->
      Model model.players model.route (getPosition model) Nothing

    _ -> model

