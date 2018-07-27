module Gigasecond exposing (add)

import Date exposing (..)
import Time exposing (..)


giga : Time
giga =
    10 ^ 12


add : Date -> Date
add date =
    date
        |> Date.toTime
        |> (+) giga
        |> Date.fromTime
