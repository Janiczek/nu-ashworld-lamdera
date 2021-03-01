module Evergreen.V18.Data.World exposing (..)

import Evergreen.V18.Data.Auth
import Evergreen.V18.Data.Player


type alias WorldLoggedOutData = 
    { players : (List Evergreen.V18.Data.Player.COtherPlayer)
    }


type alias WorldLoggedInData = 
    { player : (Evergreen.V18.Data.Player.Player Evergreen.V18.Data.Player.CPlayer)
    , otherPlayers : (List Evergreen.V18.Data.Player.COtherPlayer)
    }


type World
    = WorldNotInitialized (Evergreen.V18.Data.Auth.Auth Evergreen.V18.Data.Auth.Plaintext)
    | WorldLoggedOut (Evergreen.V18.Data.Auth.Auth Evergreen.V18.Data.Auth.Plaintext) WorldLoggedOutData
    | WorldLoggedIn WorldLoggedInData