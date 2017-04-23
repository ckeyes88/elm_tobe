module Update exposing (..)

import Message exposing (..)
import Model exposing (..)

update : Msg -> Model -> Model
update msg model =
  case msg of
    MsgForCounter counterMsg ->
      updateCounter counterMsg model
    InputChange value ->
      { model | input = value }
    MsgForCounterList counterListMsg ->
      updateCounterList counterListMsg model
    _ -> 
      model

updateCounterList : CounterListMsg -> Model -> Model 
updateCounterList msg model = 
  case msg of
    AddCounter -> 
      { model | input = ""
      , counters = { name = model.input
        , value = 0
        , id = model.nextId
        } :: model.counters
      , nextId = model.nextId + 1
      }
    _ -> 
      model

updateCounter : CounterMsg -> Model -> Model
updateCounter counterMsg model =
  case counterMsg of
    Increment id ->
      { model |
        counters = model.counters |> List.map (incrementCounterById id)}
    Decrement id ->
      { model |
        counters = model.counters |> List.map (decrementCounterById id)}
      
incrementCounterById : Int -> Counter -> Counter
incrementCounterById id counter =
  if counter.id == id then
    { counter | value = counter.value + 1 }
  else 
    counter

decrementCounterById : Int -> Counter -> Counter
decrementCounterById id counter =
  if counter.id == id then
    { counter | value = counter.value - 1 }
  else 
    counter