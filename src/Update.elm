module Update exposing (..)

import Message exposing (..)
import Model exposing (..)

update : Msg -> Model -> Model
update msg model =
  case msg of
    MsgForCounter counterMsg ->
      updateCounter counterMsg model
    MsgForInput inputMsg ->
      updateInput inputMsg model
    _ -> 
      model

-- updateCounterList
-- MsgForCounterList counterListMsg ->
--       updateCounterList counterListMsg model
updateInput : InputMsg -> Model -> Model
updateInput msg model =
  case msg of
    InputChange input -> 
      { model | input = input }

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