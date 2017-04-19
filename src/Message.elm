module Message exposing (..)

type CounterMsg
  = Increment Int
  | Decrement Int

type CounterListMsg
  = AddCounter
  | RemoveCounter Int

type InputMsg 
  = InputChange String

type Msg
  = NoOp
  | MsgForCounter CounterMsg
  | MsgForCounterList CounterListMsg
  | MsgForInput InputMsg