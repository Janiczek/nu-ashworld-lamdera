module Data.World exposing
    ( World(..)
    , WorldLoggedInData
    , WorldLoggedOutData
    , allPlayers
    , getAuth
    , isLoggedIn
    , mapAuth
    )

import Data.Auth exposing (Auth, Plaintext)
import Data.Player as Player
    exposing
        ( COtherPlayer
        , CPlayer
        , Player(..)
        )


{-| TODO it would be nice if we didn't have to send the hashed password back to the user
-}
type World
    = WorldNotInitialized (Auth Plaintext)
    | WorldLoggedOut (Auth Plaintext) WorldLoggedOutData
    | WorldLoggedIn WorldLoggedInData


type alias WorldLoggedOutData =
    { players : List COtherPlayer
    }


type alias WorldLoggedInData =
    { player : Player CPlayer
    , otherPlayers : List COtherPlayer
    }


allPlayers : WorldLoggedInData -> List COtherPlayer
allPlayers world =
    case world.player of
        NeedsCharCreated _ ->
            world.otherPlayers

        Player cPlayer ->
            Player.clientToClientOther cPlayer
                :: world.otherPlayers


isLoggedIn : World -> Bool
isLoggedIn world =
    case world of
        WorldNotInitialized _ ->
            False

        WorldLoggedOut _ _ ->
            False

        WorldLoggedIn _ ->
            True


getAuth : World -> Maybe (Auth Plaintext)
getAuth world =
    case world of
        WorldNotInitialized auth ->
            Just auth

        WorldLoggedOut auth _ ->
            Just auth

        WorldLoggedIn _ ->
            Nothing


mapAuth : (Auth Plaintext -> Auth Plaintext) -> World -> World
mapAuth fn world =
    case world of
        WorldNotInitialized auth ->
            WorldNotInitialized <| fn auth

        WorldLoggedOut auth data ->
            WorldLoggedOut (fn auth) data

        WorldLoggedIn data ->
            WorldLoggedIn data
