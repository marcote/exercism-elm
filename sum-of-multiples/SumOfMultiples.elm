module SumOfMultiples exposing (sumOfMultiples)

import List exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples limit =
    List.range 1 (limit - 1)
        |> List.filter (\x -> (List.any (\y -> x % y == 0) multiples))
        |> List.sum
