module Evergreen.V18.Frontend.Route exposing (..)

import Evergreen.V18.Data.Fight


type Route
    = Character
    | Map
    | Ladder
    | Town
    | Settings
    | FAQ
    | About
    | News
    | Fight Evergreen.V18.Data.Fight.FightInfo
    | CharCreation