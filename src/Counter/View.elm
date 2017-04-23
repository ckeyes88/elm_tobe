module Counter.View exposing (..)

import Html exposing (Html, section, h1, h3, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Model exposing (..)
import Message exposing (..)

counterView : Counter -> (String, Html Msg)
counterView counter =
  (toString(counter.id),
    section [ class "counter" ]
    [ button [ onClick (MsgForCounter (Decrement counter.id)) ]
      [ text "Decrement" ]
    , h1 [] [ text counter.name ]
    , h3 [] [ text (toString counter.value) ]
    , button [ onClick (MsgForCounter (Increment counter.id)) ]
      [ text "Increment" ]
    ]
  )