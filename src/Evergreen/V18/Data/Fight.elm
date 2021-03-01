module Evergreen.V18.Data.Fight exposing (..)

import Evergreen.V18.Data.Player


type FightResult
    = AttackerWon
    | TargetWon
    | TargetAlreadyDead


type alias FightInfo = 
    { attacker : Evergreen.V18.Data.Player.PlayerName
    , target : Evergreen.V18.Data.Player.PlayerName
    , result : FightResult
    , winnerXpGained : Int
    , winnerCapsGained : Int
    }