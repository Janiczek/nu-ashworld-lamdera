module Evergreen.V18.Data.HealthStatus exposing (..)

type HealthStatus
    = ExactHp 
    { current : Int
    , max : Int
    }
    | Unhurt
    | SlightlyWounded
    | Wounded
    | SeverelyWounded
    | AlmostDead
    | Dead
    | Alive
    | Unknown