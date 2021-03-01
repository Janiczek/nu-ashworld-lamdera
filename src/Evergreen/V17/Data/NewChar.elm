module Evergreen.V17.Data.NewChar exposing (..)

import Evergreen.V17.Data.Special


type alias NewChar =
    { special : Evergreen.V17.Data.Special.Special
    , availableSpecial : Int
    }


init : NewChar
init =
    { special = Evergreen.V17.Data.Special.init
    , availableSpecial = 5
    }
