module Main exposing (..)
<<<<<<< HEAD
=======
import Html exposing (Html, text)
>>>>>>> 97dab4b68906555c4012cab67fdf2ead95b8bc96

import Html exposing (Html, h1, button, input, text, section, li)
import Html.Attributes exposing (class, value, type_)
import Html.Events exposing (onClick, onInput)
import Html.Keyed exposing (ul)

import Model exposing (..)
import Update exposing (..)
import Message exposing (..)
import Counter.View exposing (..)

initialModel : Model
initialModel =
  { counters = []
  , input = ""
  , nextId = 0
  }

view : Model -> Html Msg
view model =
  section [ class "app" ]
  [
    section [ class "counter" ] 
    [ input [ type_ "text", value model.input, onInput InputChange]
      []
    , button [ onClick (MsgForCounterList AddCounter)]
      [ text "Add new counter" ]
    ]
  , ul []
    (renderCounters model.counters)
  ]

renderCounters : List Counter -> List (String, Html Msg)
renderCounters counters = 
  counters
  |> List.map counterView

main : Program Never Model Msg
main =
  Html.beginnerProgram 
  { model = initialModel
  , update = update
  , view = view
  }

