module Data.Map.Pathfinding exposing
    ( apCost
    , path
    )

import Data.Map as Map exposing (TileCoords)
import Data.Map.Terrain as Terrain
import Data.Special exposing (Special)
import Data.Special.Perception exposing (PerceptionLevel(..))
import RasterShapes
import Raycast2D
import Set exposing (Set)


apCost : Set TileCoords -> Int
apCost pathTaken =
    pathTaken
        |> Set.toList
        |> List.map (Terrain.forCoords >> Terrain.apCost)
        |> List.sum
        |> ceiling


{-| TODO add leastApCostPath that will use A\*
-}
path :
    PerceptionLevel
    ->
        { from : TileCoords
        , to : TileCoords
        }
    -> Set TileCoords
path level =
    case level of
        Perfect ->
            okayPath

        Great ->
            okayPath

        Good ->
            okayPath

        Bad ->
            inefficientPath

        Atrocious ->
            inefficientPath


inefficientPath :
    { from : TileCoords
    , to : TileCoords
    }
    -> Set TileCoords
inefficientPath { from, to } =
    Raycast2D.touchedTiles
        Map.tileSizeFloat
        (Map.tileCenterPx from)
        (Map.tileCenterPx to)
        |> Set.remove from


okayPath :
    { from : TileCoords
    , to : TileCoords
    }
    -> Set TileCoords
okayPath { from, to } =
    let
        ( fromX, fromY ) =
            from

        ( toX, toY ) =
            to

        toCoords : { x : Int, y : Int } -> TileCoords
        toCoords { x, y } =
            ( x, y )
    in
    RasterShapes.line
        { x = fromX, y = fromY }
        { x = toX, y = toY }
        |> List.map toCoords
        |> Set.fromList
        |> Set.remove from
