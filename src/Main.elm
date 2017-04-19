module Main exposing (..)

import Html exposing (Html, h1, button, input, text, section)
import Html.Attributes exposing (class, value, type_)
import Html.Events exposing (onClick, onInput)

import Model exposing (..)
import Update exposing (..)
import Message exposing (..)

initialModel : Model
initialModel =
  { counters = []
  , input = ""
  }

view : Model -> Html Msg
view model =
  section [ class "counter" ] 
  [ input [ type_ "text", value model.input, onInput (MsgForInput (InputChange ))]
  ]

main : Program Never Model Msg
main =
  Html.beginnerProgram 
  { model = initialModel
  , update = update
  , view = view
  }

