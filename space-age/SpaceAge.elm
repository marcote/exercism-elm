module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


secondsToYear : Float -> Float -> Float
secondsToYear seconds period =
    ((seconds / 3600) / 24) / (365 * period)


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    case planet of
        Earth ->
            secondsToYear seconds 1

        Mercury ->
            secondsToYear seconds 0.2408467

        Venus ->
            secondsToYear seconds 0.61519726

        Mars ->
            secondsToYear seconds 1.8808158

        Jupiter ->
            secondsToYear seconds 11.862615

        Saturn ->
            secondsToYear seconds 29.447498

        Uranus ->
            secondsToYear seconds 84.016846

        Neptune ->
            secondsToYear seconds 164.79132
