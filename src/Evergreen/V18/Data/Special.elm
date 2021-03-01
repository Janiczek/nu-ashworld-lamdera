module Evergreen.V18.Data.Special exposing (..)

type alias Special = 
    { strength : Int
    , perception : Int
    , endurance : Int
    , charisma : Int
    , intelligence : Int
    , agility : Int
    , luck : Int
    }


type SpecialType
    = Strength
    | Perception
    | Endurance
    | Charisma
    | Intelligence
    | Agility
    | Luck