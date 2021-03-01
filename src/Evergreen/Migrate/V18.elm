module Evergreen.Migrate.V18 exposing (..)

import Evergreen.V17.Data.Auth as AOld
import Evergreen.V17.Data.Fight as FOld
import Evergreen.V17.Data.Player as POld
import Evergreen.V17.Types as Old
import Evergreen.V18.Data.Auth as ANew
import Evergreen.V18.Data.Fight as FNew
import Evergreen.V18.Data.Player as PNew
import Evergreen.V18.Types as New
import Lamdera.Migrations exposing (..)


migratePassword : AOld.Password a -> ANew.Password a
migratePassword (AOld.Password old) =
    ANew.Password old


migrateSPlayer : POld.SPlayer -> PNew.SPlayer
migrateSPlayer old =
    { name = old.name
    , password = migratePassword old.password
    , hp = old.hp
    , maxHp = old.maxHp
    , xp = old.xp
    , special = old.special
    , availableSpecial = old.availableSpecial
    , caps = old.caps
    , ap = old.ap
    , wins = old.wins
    , losses = old.losses
    }


migrateFightInfo : FOld.FightInfo -> FNew.FightInfo
migrateFightInfo old =
    { attacker = old.attacker
    , target = old.target
    , result =
        case old.result of
            FOld.AttackerWon ->
                FNew.AttackerWon

            FOld.TargetWon ->
                FNew.TargetWon

            FOld.TargetAlreadyDead ->
                FNew.TargetAlreadyDead
    , winnerXpGained = old.winnerXpGained
    , winnerCapsGained = old.winnerCapsGained
    }


frontendModel : Old.FrontendModel -> ModelMigration New.FrontendModel New.FrontendMsg
frontendModel old =
    ModelUnchanged


backendModel : Old.BackendModel -> ModelMigration New.BackendModel New.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Old.FrontendMsg -> MsgMigration New.FrontendMsg New.FrontendMsg
frontendMsg old =
    MsgUnchanged


toBackend : Old.ToBackend -> MsgMigration New.ToBackend New.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Old.BackendMsg -> MsgMigration New.BackendMsg New.BackendMsg
backendMsg old =
    MsgMigrated
        ( case old of
            Old.Connected sId cId ->
                New.Connected sId cId

            Old.GeneratedFight cId sPlayer fight ->
                New.GeneratedFight
                    cId
                    (migrateSPlayer sPlayer)
                    (migrateFightInfo fight)
        , Cmd.none
        )


toFrontend : Old.ToFrontend -> MsgMigration New.ToFrontend New.FrontendMsg
toFrontend old =
    MsgUnchanged
