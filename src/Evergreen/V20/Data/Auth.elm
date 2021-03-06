module Evergreen.V20.Data.Auth exposing (..)


type Plaintext
    = Plaintext


type Password a
    = Password String


type alias Auth a =
    { name : String
    , password : Password a
    }


type Verified
    = Verified


type Hashed
    = Hashed


init : Auth a
init =
    { name = ""
    , password = Password ""
    }
