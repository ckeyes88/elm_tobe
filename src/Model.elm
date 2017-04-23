module Model exposing (..)

type alias Counter =
  { name : String
  , id : Int
  , value : Int
  }

type alias Model =
  { counters : List Counter
  , input : String
  , nextId : Int
  }