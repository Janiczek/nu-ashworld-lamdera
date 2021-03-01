module Evergreen.V18.Data.NewChar exposing (..)

import Evergreen.V18.Data.Special


type alias NewChar = 
    { special : Evergreen.V18.Data.Special.Special
    , availableSpecial : Int
    }