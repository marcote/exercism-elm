module Triangle exposing (Triangle(..), triangleKind, version)

import List exposing (..)
import List.Extra exposing (..)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


version : Int
version =
    2


isProperTriangle : List comparable -> Bool
isProperTriangle sides =
    case List.maximum sides of
        Just value ->
            (2 * value) < List.sum sides

        Nothing ->
            False


hasInvalidLengths : List comparable -> Bool
hasInvalidLengths sides =
    (List.any (\k -> k <= 0) sides)


isIsosceles : List comparable -> Bool
isIsosceles sides =
    List.length (List.Extra.unique sides) == 2


triangleKind : comparable -> comparable -> comparable -> Result String Triangle
triangleKind x y z =
    let
        sides =
            [ x, y, z ]
    in
        if hasInvalidLengths sides then
            Err "Invalid lengths"
        else if (not (isProperTriangle sides)) then
            Err "Violates inequality"
        else if (x == y) && (y == z) then
            Ok Equilateral
        else if isIsosceles sides then
            Ok Isosceles
        else
            Ok Scalene
