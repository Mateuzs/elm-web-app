--this module is for tasks requiring remote connection, data
-- decoding and encoding etc.


module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (PersonId, FamousPerson, Quote)
import RemoteData
import Time exposing (..)


--this function send a HTTP request in order to get a list
-- of famous people

fetchFamousPeople : Cmd Msg
fetchFamousPeople =
    Http.get fetchFamousPeopleUrl famousPeopleDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchFamousPeople


-- address of our server

fetchFamousPeopleUrl : String
fetchFamousPeopleUrl =
    "http://localhost:7000/famousPeople"


--special Decoder for JSON data

famousPeopleDecoder : Decode.Decoder (List FamousPerson)
famousPeopleDecoder =
    Decode.list famousPersonDecoder


famousPersonDecoder : Decode.Decoder FamousPerson
famousPersonDecoder =
    decode FamousPerson
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "surname" Decode.string
        |> required "age" Decode.string
        |> required "profession" Decode.string
        |> required "description" Decode.string




---- functions for gettin a quote

fetchQuote : Int ->  Cmd Msg
fetchQuote randomNumber =
    Http.get (fetchQuoteUrl randomNumber) quoteDecoder
     |> RemoteData.sendRequest
     |> Cmd.map Msgs.OnFetchQuote

fetchQuoteUrl : Int -> String
fetchQuoteUrl randomNumber =
    "Http://localhost:7000/Quotes/" ++ (toString randomNumber)



--JSON decoder for given quote



quoteDecoder : Decode.Decoder Quote
quoteDecoder =
    decode Quote
        |> required "quote" Decode.string


randomNumber: Int
randomNumber = round (inMinutes (millisecond) )



















