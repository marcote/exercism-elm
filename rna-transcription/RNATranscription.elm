module RNATranscription exposing (toRNA, mapping)

import List exposing (..)
import String exposing (..)


-- DNA : ACGT
-- RNA : ACGU


mapping : Char -> Result Char Char
mapping nucleotide =
    case nucleotide of
        'G' ->
            Ok 'C'

        'C' ->
            Ok 'G'

        'T' ->
            Ok 'A'

        'A' ->
            Ok 'U'

        _ ->
            Err nucleotide


toRNA : String -> Result Char String
toRNA dna =
    case String.uncons dna of
        Nothing ->
            Ok ""

        Just ( hd, tl ) ->
            Result.map2 String.cons (mapping hd) (toRNA tl)
