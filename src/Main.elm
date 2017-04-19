module Main exposing (..)
import Html exposing (Html, h1, button, text, section)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

type Msg = Increment
  | Decrement

type alias Model = 
  Int

initialModel : Model
initialModel =
  0

update : Msg -> Model -> Model
update msg currentVal =
  case msg of
    Increment -> 
      currentVal + 1
    Decrement ->
      currentVal - 1

view : Model -> Html Msg
view model =
  section [ class "counter" ] 
  [ button [ onClick Decrement ]
    [ text "-" ]
  , h1 []
    [ text (toString model)
    ]
  , button [ onClick Increment ]
    [ text "+" ]
  ]

main : Program Never Model Msg
main =
  Html.beginnerProgram 
  { model = initialModel
  , update = update
  , view = view
  }

