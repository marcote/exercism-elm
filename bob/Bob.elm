module Bob exposing (..)

import String exposing (..)
import Char exposing (..)


hey : String -> String
hey remark =
    if isNothing remark then
        "Fine. Be that way!"
    else if isForceFul remark then
        "Calm down, I know what I'm doing!"
    else if isShout remark then
        "Whoa, chill out!"
    else if isQuestion remark then
        "Sure."
    else
        "Whatever."


isQuestion : String -> Bool
isQuestion =
    String.endsWith "?"


isNothing : String -> Bool
isNothing =
    String.trim >> String.isEmpty


isShout : String -> Bool
isShout message =
    let
        hasUpper =
            message
                |> String.filter Char.isUpper
                |> not
                << String.isEmpty

        hasLower =
            message
                |> String.filter Char.isLower
                |> not
                << String.isEmpty
    in
        not (String.isEmpty message) && hasUpper && not hasLower


isForceFul : String -> Bool
isForceFul message =
    isShout message && isQuestion message
