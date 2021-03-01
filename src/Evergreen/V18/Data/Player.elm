module Evergreen.V18.Data.Player exposing (..)

import Evergreen.V18.Data.Auth
import Evergreen.V18.Data.HealthStatus
import Evergreen.V18.Data.Special
import Evergreen.V18.Data.Xp


type alias PlayerName = String


type alias COtherPlayer = 
    { level : Evergreen.V18.Data.Xp.Level
    , name : PlayerName
    , wins : Int
    , losses : Int
    , healthStatus : Evergreen.V18.Data.HealthStatus.HealthStatus
    }


type alias CPlayer = 
    { hp : Int
    , maxHp : Int
    , xp : Evergreen.V18.Data.Xp.Xp
    , name : PlayerName
    , special : Evergreen.V18.Data.Special.Special
    , availableSpecial : Int
    , caps : Int
    , ap : Int
    , wins : Int
    , losses : Int
    }


type Player a
    = NeedsCharCreated (Evergreen.V18.Data.Auth.Auth Evergreen.V18.Data.Auth.Verified)
    | Player a


type alias SPlayer = 
    { name : PlayerName
    , password : (Evergreen.V18.Data.Auth.Password Evergreen.V18.Data.Auth.Verified)
    , hp : Int
    , maxHp : Int
    , xp : Int
    , special : Evergreen.V18.Data.Special.Special
    , availableSpecial : Int
    , caps : Int
    , ap : Int
    , wins : Int
    , losses : Int
    }