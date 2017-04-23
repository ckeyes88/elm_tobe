module Message exposing (..)

type CounterMsg
  = Increment Int
  | Decrement Int

type CounterListMsg
  = AddCounter
  | RemoveCounter Int

type Msg
  = NoOp
  | MsgForCounter CounterMsg
  | MsgForCounterList CounterListMsg
  | InputChange String