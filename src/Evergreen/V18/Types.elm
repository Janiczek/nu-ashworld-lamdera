module Evergreen.V18.Types exposing (..)

import Browser
import Browser.Navigation
import Dict
import Evergreen.V18.Data.Auth
import Evergreen.V18.Data.Fight
import Evergreen.V18.Data.NewChar
import Evergreen.V18.Data.Player
import Evergreen.V18.Data.Special
import Evergreen.V18.Data.World
import Evergreen.V18.Frontend.Route
import Lamdera
import Time
import Url


type alias FrontendModel =
    { key : Browser.Navigation.Key
    , zone : Time.Zone
    , route : Evergreen.V18.Frontend.Route.Route
    , world : Evergreen.V18.Data.World.World
    , newChar : Evergreen.V18.Data.NewChar.NewChar
    }


type alias BackendModel =
    { players : (Dict.Dict Evergreen.V18.Data.Player.PlayerName (Evergreen.V18.Data.Player.Player Evergreen.V18.Data.Player.SPlayer))
    , loggedInPlayers : (Dict.Dict Lamdera.ClientId Evergreen.V18.Data.Player.PlayerName)
    }


type FrontendMsg
    = UrlClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GoToRoute Evergreen.V18.Frontend.Route.Route
    | Logout
    | Login
    | Register
    | NoOp
    | GetZone Time.Zone
    | AskToFight Evergreen.V18.Data.Player.PlayerName
    | Refresh
    | AskToIncSpecial Evergreen.V18.Data.Special.SpecialType
    | SetAuthName String
    | SetAuthPassword String
    | CreateChar


type ToBackend
    = LogMeIn (Evergreen.V18.Data.Auth.Auth Evergreen.V18.Data.Auth.Hashed)
    | RegisterMe (Evergreen.V18.Data.Auth.Auth Evergreen.V18.Data.Auth.Hashed)
    | CreateNewChar Evergreen.V18.Data.NewChar.NewChar
    | LogMeOut
    | Fight Evergreen.V18.Data.Player.PlayerName
    | RefreshPlease
    | IncSpecial Evergreen.V18.Data.Special.SpecialType


type BackendMsg
    = Connected Lamdera.SessionId Lamdera.ClientId
    | Disconnected Lamdera.SessionId Lamdera.ClientId
    | GeneratedFight Lamdera.ClientId Evergreen.V18.Data.Player.SPlayer Evergreen.V18.Data.Fight.FightInfo


type ToFrontend
    = YourCurrentWorld Evergreen.V18.Data.World.WorldLoggedInData
    | CurrentWorld Evergreen.V18.Data.World.WorldLoggedOutData
    | YourFightResult (Evergreen.V18.Data.Fight.FightInfo, Evergreen.V18.Data.World.WorldLoggedInData)
    | YoureLoggedIn Evergreen.V18.Data.World.WorldLoggedInData
    | YoureRegistered Evergreen.V18.Data.World.WorldLoggedInData
    | YouHaveCreatedChar Evergreen.V18.Data.World.WorldLoggedInData
    | YoureLoggedOut Evergreen.V18.Data.World.WorldLoggedOutData