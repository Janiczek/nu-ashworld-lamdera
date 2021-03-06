module Data.Auth exposing
    ( Auth
    , HasAuth
    , Hashed
    , Password(..)
    , Plaintext
    , Verified
    , hash
    , init
    , isEmpty
    , promote
    , setPlaintextPassword
    , unwrap
    , verify
    )

import Sha256


type alias Auth a =
    { name : String
    , password : Password a
    }


init : Auth a
init =
    { name = ""
    , password = Password ""
    }


type Password a
    = Password String


type Plaintext
    = Plaintext


type Hashed
    = Hashed


{-| All verified passwords are hashed already.
(The transition to Verified can only be done from Hashed, not Plaintext)
-}
type Verified
    = Verified


type alias HasAuth a =
    { a
        | name : String
        , password : Password Verified
    }


setPlaintextPassword : String -> Auth a -> Auth Plaintext
setPlaintextPassword password_ auth =
    { name = auth.name
    , password = Password password_
    }


hash : Auth Plaintext -> Auth Hashed
hash auth =
    let
        (Password password_) =
            auth.password
    in
    { name = auth.name
    , password = Password <| Sha256.sha256 password_
    }


verify : Auth Hashed -> HasAuth a -> Bool
verify auth sourceOfTruth =
    (auth.name == sourceOfTruth.name)
        && verifyPassword auth.password sourceOfTruth.password


verifyPassword : Password Hashed -> Password Verified -> Bool
verifyPassword (Password tested) (Password correct) =
    tested == correct


{-| Only use this when you have a good reason, eg. registering,
changing a password, etc.
-}
promote : Auth Hashed -> Auth Verified
promote auth =
    let
        (Password password_) =
            auth.password
    in
    { name = auth.name
    , password = Password password_
    }


unwrap : Password a -> String
unwrap (Password password_) =
    password_


isEmpty : Password Hashed -> Bool
isEmpty (Password password_) =
    password_ == emptyHashedPassword


emptyHashedPassword : String
emptyHashedPassword =
    Sha256.sha256 ""
