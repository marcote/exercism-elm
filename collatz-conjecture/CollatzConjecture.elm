module CollatzConjecture exposing (collatz, collatzCounter)

import List exposing (..)


collatzCounter : Int -> Int
collatzCounter start =
    case start of
        1 ->
            0

        n ->
            if n % 2 == 0 then
                collatzCounter (n // 2) + 1
            else
                collatzCounter (n * 3 + 1) + 1


collatz : Int -> Result String Int
collatz start =
    if (start > 0) then
        Ok (collatzCounter start)
    else
        Err
            "Only positive numbers are allowed"
