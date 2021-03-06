module Evergreen.V22.Types exposing (..)

import Browser
import Browser.Navigation
import Dict
import Evergreen.V22.Data.Auth
import Evergreen.V22.Data.Fight
import Evergreen.V22.Data.NewChar
import Evergreen.V22.Data.Player
import Evergreen.V22.Data.Special
import Evergreen.V22.Data.World
import Evergreen.V22.Frontend.Route
import Lamdera
import Time
import Url


type alias FrontendModel =
    { key : Browser.Navigation.Key
    , time : Time.Posix
    , zone : Time.Zone
    , route : Evergreen.V22.Frontend.Route.Route
    , world : Evergreen.V22.Data.World.World
    , newChar : Evergreen.V22.Data.NewChar.NewChar
    , authError : (Maybe String)
    }


type alias BackendModel =
    { players : (Dict.Dict Evergreen.V22.Data.Player.PlayerName (Evergreen.V22.Data.Player.Player Evergreen.V22.Data.Player.SPlayer))
    , loggedInPlayers : (Dict.Dict Lamdera.ClientId Evergreen.V22.Data.Player.PlayerName)
    , nextWantedTick : (Maybe Time.Posix)
    }


type FrontendMsg
    = UrlClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GoToRoute Evergreen.V22.Frontend.Route.Route
    | Logout
    | Login
    | Register
    | NoOp
    | GotZone Time.Zone
    | GotTime Time.Posix
    | AskToFight Evergreen.V22.Data.Player.PlayerName
    | Refresh
    | AskToIncSpecial Evergreen.V22.Data.Special.SpecialType
    | SetAuthName String
    | SetAuthPassword String
    | CreateChar
    | NewCharIncSpecial Evergreen.V22.Data.Special.SpecialType
    | NewCharDecSpecial Evergreen.V22.Data.Special.SpecialType


type ToBackend
    = LogMeIn (Evergreen.V22.Data.Auth.Auth Evergreen.V22.Data.Auth.Hashed)
    | RegisterMe (Evergreen.V22.Data.Auth.Auth Evergreen.V22.Data.Auth.Hashed)
    | CreateNewChar Evergreen.V22.Data.NewChar.NewChar
    | LogMeOut
    | Fight Evergreen.V22.Data.Player.PlayerName
    | RefreshPlease
    | IncSpecial Evergreen.V22.Data.Special.SpecialType


type BackendMsg
    = Connected Lamdera.SessionId Lamdera.ClientId
    | Disconnected Lamdera.SessionId Lamdera.ClientId
    | GeneratedFight Lamdera.ClientId Evergreen.V22.Data.Player.SPlayer Evergreen.V22.Data.Fight.FightInfo
    | Tick Time.Posix


type ToFrontend
    = YourCurrentWorld Evergreen.V22.Data.World.WorldLoggedInData
    | CurrentWorld Evergreen.V22.Data.World.WorldLoggedOutData
    | YourFightResult (Evergreen.V22.Data.Fight.FightInfo, Evergreen.V22.Data.World.WorldLoggedInData)
    | YoureLoggedIn Evergreen.V22.Data.World.WorldLoggedInData
    | YoureRegistered Evergreen.V22.Data.World.WorldLoggedInData
    | YouHaveCreatedChar Evergreen.V22.Data.World.WorldLoggedInData
    | YoureLoggedOut Evergreen.V22.Data.World.WorldLoggedOutData
    | AuthError String