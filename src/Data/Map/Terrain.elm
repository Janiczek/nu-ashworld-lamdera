module Data.Map.Terrain exposing
    ( Terrain(..)
    , apCost
    , forCoords
    , isPassable
    )

import Data.Map exposing (TileCoords)
import Dict exposing (Dict)
import Logic


type Terrain
    = Ocean
    | Coast
    | Land
    | Mountains


forCoords : TileCoords -> Terrain
forCoords coords =
    Dict.get coords terrain
        |> Maybe.withDefault Mountains


apCost : Terrain -> Float
apCost terrain_ =
    case terrain_ of
        Ocean ->
            -- anything >= Logic.maxAp is non-passable
            toFloat Logic.maxAp

        Coast ->
            1

        Land ->
            0.5

        Mountains ->
            1.5


isPassable : Terrain -> Bool
isPassable terrain_ =
    case terrain_ of
        Ocean ->
            False

        Coast ->
            True

        Land ->
            True

        Mountains ->
            True


terrain : Dict TileCoords Terrain
terrain =
    -- The rest are mountains
    Dict.fromList
        [ ( ( 0, 0 ), Ocean )
        , ( ( 0, 1 ), Ocean )
        , ( ( 0, 2 ), Ocean )
        , ( ( 0, 3 ), Ocean )
        , ( ( 0, 4 ), Ocean )
        , ( ( 0, 5 ), Ocean )
        , ( ( 0, 6 ), Ocean )
        , ( ( 0, 7 ), Coast )
        , ( ( 0, 8 ), Coast )
        , ( ( 0, 9 ), Coast )
        , ( ( 0, 10 ), Coast )
        , ( ( 0, 11 ), Ocean )
        , ( ( 0, 12 ), Ocean )
        , ( ( 0, 13 ), Ocean )
        , ( ( 0, 14 ), Ocean )
        , ( ( 0, 15 ), Ocean )
        , ( ( 0, 16 ), Ocean )
        , ( ( 0, 17 ), Ocean )
        , ( ( 0, 18 ), Ocean )
        , ( ( 0, 19 ), Ocean )
        , ( ( 0, 20 ), Ocean )
        , ( ( 0, 21 ), Ocean )
        , ( ( 0, 22 ), Ocean )
        , ( ( 0, 23 ), Ocean )
        , ( ( 0, 24 ), Ocean )
        , ( ( 0, 25 ), Ocean )
        , ( ( 0, 26 ), Ocean )
        , ( ( 0, 27 ), Ocean )
        , ( ( 0, 28 ), Ocean )
        , ( ( 0, 29 ), Ocean )
        , ( ( 1, 0 ), Coast )
        , ( ( 1, 1 ), Coast )
        , ( ( 1, 2 ), Coast )
        , ( ( 1, 3 ), Coast )
        , ( ( 1, 4 ), Coast )
        , ( ( 1, 5 ), Coast )
        , ( ( 1, 6 ), Coast )
        , ( ( 1, 9 ), Land )
        , ( ( 1, 10 ), Coast )
        , ( ( 1, 11 ), Coast )
        , ( ( 1, 12 ), Ocean )
        , ( ( 1, 13 ), Ocean )
        , ( ( 1, 14 ), Ocean )
        , ( ( 1, 15 ), Ocean )
        , ( ( 1, 16 ), Ocean )
        , ( ( 1, 17 ), Ocean )
        , ( ( 1, 18 ), Ocean )
        , ( ( 1, 19 ), Ocean )
        , ( ( 1, 20 ), Ocean )
        , ( ( 1, 21 ), Ocean )
        , ( ( 1, 22 ), Ocean )
        , ( ( 1, 23 ), Ocean )
        , ( ( 1, 24 ), Ocean )
        , ( ( 1, 25 ), Ocean )
        , ( ( 1, 26 ), Ocean )
        , ( ( 1, 27 ), Ocean )
        , ( ( 1, 28 ), Ocean )
        , ( ( 1, 29 ), Ocean )
        , ( ( 2, 1 ), Coast )
        , ( ( 2, 2 ), Land )
        , ( ( 2, 3 ), Land )
        , ( ( 2, 4 ), Land )
        , ( ( 2, 5 ), Land )
        , ( ( 2, 6 ), Land )
        , ( ( 2, 11 ), Land )
        , ( ( 2, 12 ), Coast )
        , ( ( 2, 13 ), Coast )
        , ( ( 2, 14 ), Coast )
        , ( ( 2, 15 ), Coast )
        , ( ( 2, 16 ), Coast )
        , ( ( 2, 17 ), Ocean )
        , ( ( 2, 18 ), Ocean )
        , ( ( 2, 19 ), Ocean )
        , ( ( 2, 20 ), Ocean )
        , ( ( 2, 21 ), Ocean )
        , ( ( 2, 22 ), Ocean )
        , ( ( 2, 23 ), Ocean )
        , ( ( 2, 24 ), Ocean )
        , ( ( 2, 25 ), Ocean )
        , ( ( 2, 26 ), Ocean )
        , ( ( 2, 27 ), Ocean )
        , ( ( 2, 28 ), Ocean )
        , ( ( 2, 29 ), Ocean )
        , ( ( 3, 0 ), Land )
        , ( ( 3, 3 ), Land )
        , ( ( 3, 4 ), Land )
        , ( ( 3, 6 ), Land )
        , ( ( 3, 7 ), Land )
        , ( ( 3, 8 ), Land )
        , ( ( 3, 10 ), Land )
        , ( ( 3, 18 ), Coast )
        , ( ( 3, 19 ), Ocean )
        , ( ( 3, 20 ), Ocean )
        , ( ( 3, 21 ), Ocean )
        , ( ( 3, 22 ), Ocean )
        , ( ( 3, 23 ), Ocean )
        , ( ( 3, 24 ), Ocean )
        , ( ( 3, 25 ), Ocean )
        , ( ( 3, 26 ), Ocean )
        , ( ( 3, 27 ), Ocean )
        , ( ( 3, 28 ), Ocean )
        , ( ( 3, 29 ), Ocean )
        , ( ( 4, 3 ), Land )
        , ( ( 4, 4 ), Land )
        , ( ( 4, 7 ), Land )
        , ( ( 4, 8 ), Land )
        , ( ( 4, 9 ), Land )
        , ( ( 4, 10 ), Land )
        , ( ( 4, 15 ), Land )
        , ( ( 4, 19 ), Coast )
        , ( ( 4, 20 ), Coast )
        , ( ( 4, 21 ), Ocean )
        , ( ( 4, 22 ), Ocean )
        , ( ( 4, 23 ), Ocean )
        , ( ( 4, 24 ), Ocean )
        , ( ( 4, 25 ), Ocean )
        , ( ( 4, 26 ), Ocean )
        , ( ( 4, 27 ), Ocean )
        , ( ( 4, 28 ), Ocean )
        , ( ( 4, 29 ), Ocean )
        , ( ( 5, 1 ), Land )
        , ( ( 5, 2 ), Land )
        , ( ( 5, 3 ), Land )
        , ( ( 5, 4 ), Land )
        , ( ( 5, 7 ), Land )
        , ( ( 5, 8 ), Land )
        , ( ( 5, 10 ), Land )
        , ( ( 5, 11 ), Land )
        , ( ( 5, 12 ), Land )
        , ( ( 5, 15 ), Land )
        , ( ( 5, 16 ), Land )
        , ( ( 5, 18 ), Land )
        , ( ( 5, 20 ), Coast )
        , ( ( 5, 21 ), Coast )
        , ( ( 5, 22 ), Ocean )
        , ( ( 5, 23 ), Ocean )
        , ( ( 5, 24 ), Ocean )
        , ( ( 5, 25 ), Ocean )
        , ( ( 5, 26 ), Ocean )
        , ( ( 5, 27 ), Ocean )
        , ( ( 5, 28 ), Ocean )
        , ( ( 5, 29 ), Ocean )
        , ( ( 6, 1 ), Land )
        , ( ( 6, 2 ), Land )
        , ( ( 6, 3 ), Land )
        , ( ( 6, 4 ), Land )
        , ( ( 6, 5 ), Land )
        , ( ( 6, 6 ), Land )
        , ( ( 6, 9 ), Land )
        , ( ( 6, 10 ), Land )
        , ( ( 6, 15 ), Land )
        , ( ( 6, 16 ), Land )
        , ( ( 6, 17 ), Land )
        , ( ( 6, 18 ), Land )
        , ( ( 6, 19 ), Land )
        , ( ( 6, 21 ), Coast )
        , ( ( 6, 22 ), Coast )
        , ( ( 6, 23 ), Coast )
        , ( ( 6, 24 ), Ocean )
        , ( ( 6, 25 ), Ocean )
        , ( ( 6, 26 ), Ocean )
        , ( ( 6, 27 ), Ocean )
        , ( ( 6, 28 ), Ocean )
        , ( ( 6, 29 ), Ocean )
        , ( ( 7, 1 ), Land )
        , ( ( 7, 2 ), Land )
        , ( ( 7, 3 ), Land )
        , ( ( 7, 4 ), Land )
        , ( ( 7, 5 ), Land )
        , ( ( 7, 8 ), Land )
        , ( ( 7, 9 ), Land )
        , ( ( 7, 10 ), Land )
        , ( ( 7, 16 ), Land )
        , ( ( 7, 18 ), Land )
        , ( ( 7, 19 ), Land )
        , ( ( 7, 23 ), Coast )
        , ( ( 7, 24 ), Coast )
        , ( ( 7, 25 ), Ocean )
        , ( ( 7, 26 ), Ocean )
        , ( ( 7, 27 ), Ocean )
        , ( ( 7, 28 ), Ocean )
        , ( ( 7, 29 ), Ocean )
        , ( ( 8, 3 ), Land )
        , ( ( 8, 4 ), Land )
        , ( ( 8, 5 ), Land )
        , ( ( 8, 6 ), Land )
        , ( ( 8, 7 ), Land )
        , ( ( 8, 8 ), Land )
        , ( ( 8, 9 ), Land )
        , ( ( 8, 13 ), Land )
        , ( ( 8, 14 ), Land )
        , ( ( 8, 15 ), Land )
        , ( ( 8, 16 ), Land )
        , ( ( 8, 19 ), Land )
        , ( ( 8, 22 ), Coast )
        , ( ( 8, 23 ), Coast )
        , ( ( 8, 24 ), Coast )
        , ( ( 8, 25 ), Coast )
        , ( ( 8, 26 ), Coast )
        , ( ( 8, 27 ), Ocean )
        , ( ( 8, 28 ), Ocean )
        , ( ( 8, 29 ), Ocean )
        , ( ( 9, 1 ), Land )
        , ( ( 9, 3 ), Land )
        , ( ( 9, 4 ), Land )
        , ( ( 9, 5 ), Land )
        , ( ( 9, 6 ), Land )
        , ( ( 9, 11 ), Land )
        , ( ( 9, 12 ), Land )
        , ( ( 9, 13 ), Land )
        , ( ( 9, 14 ), Land )
        , ( ( 9, 15 ), Land )
        , ( ( 9, 16 ), Land )
        , ( ( 9, 20 ), Land )
        , ( ( 9, 21 ), Coast )
        , ( ( 9, 22 ), Coast )
        , ( ( 9, 23 ), Coast )
        , ( ( 9, 24 ), Coast )
        , ( ( 9, 25 ), Coast )
        , ( ( 9, 28 ), Coast )
        , ( ( 9, 29 ), Coast )
        , ( ( 10, 1 ), Land )
        , ( ( 10, 2 ), Land )
        , ( ( 10, 3 ), Land )
        , ( ( 10, 10 ), Land )
        , ( ( 10, 11 ), Land )
        , ( ( 10, 12 ), Land )
        , ( ( 10, 13 ), Land )
        , ( ( 10, 14 ), Land )
        , ( ( 10, 15 ), Land )
        , ( ( 10, 16 ), Land )
        , ( ( 10, 21 ), Coast )
        , ( ( 10, 25 ), Coast )
        , ( ( 10, 26 ), Coast )
        , ( ( 10, 27 ), Coast )
        , ( ( 10, 29 ), Coast )
        , ( ( 11, 1 ), Land )
        , ( ( 11, 2 ), Land )
        , ( ( 11, 11 ), Land )
        , ( ( 11, 12 ), Land )
        , ( ( 11, 13 ), Land )
        , ( ( 11, 14 ), Land )
        , ( ( 11, 15 ), Land )
        , ( ( 11, 16 ), Land )
        , ( ( 11, 17 ), Land )
        , ( ( 11, 18 ), Land )
        , ( ( 11, 19 ), Land )
        , ( ( 11, 20 ), Land )
        , ( ( 11, 21 ), Land )
        , ( ( 11, 22 ), Land )
        , ( ( 11, 23 ), Land )
        , ( ( 11, 27 ), Coast )
        , ( ( 11, 29 ), Coast )
        , ( ( 12, 11 ), Land )
        , ( ( 12, 12 ), Land )
        , ( ( 12, 13 ), Land )
        , ( ( 12, 14 ), Land )
        , ( ( 12, 15 ), Land )
        , ( ( 12, 16 ), Land )
        , ( ( 12, 17 ), Land )
        , ( ( 12, 18 ), Land )
        , ( ( 12, 19 ), Land )
        , ( ( 12, 20 ), Land )
        , ( ( 12, 21 ), Land )
        , ( ( 12, 22 ), Land )
        , ( ( 12, 23 ), Land )
        , ( ( 12, 24 ), Land )
        , ( ( 12, 29 ), Coast )
        , ( ( 13, 13 ), Land )
        , ( ( 13, 14 ), Land )
        , ( ( 13, 15 ), Land )
        , ( ( 13, 16 ), Land )
        , ( ( 13, 17 ), Land )
        , ( ( 13, 18 ), Land )
        , ( ( 13, 19 ), Land )
        , ( ( 13, 20 ), Land )
        , ( ( 13, 21 ), Land )
        , ( ( 13, 22 ), Land )
        , ( ( 13, 23 ), Land )
        , ( ( 13, 24 ), Land )
        , ( ( 13, 25 ), Land )
        , ( ( 14, 18 ), Land )
        , ( ( 14, 19 ), Land )
        , ( ( 14, 20 ), Land )
        , ( ( 14, 21 ), Land )
        , ( ( 14, 22 ), Land )
        , ( ( 14, 23 ), Land )
        , ( ( 14, 24 ), Land )
        , ( ( 14, 25 ), Land )
        , ( ( 14, 26 ), Land )
        , ( ( 15, 24 ), Land )
        , ( ( 15, 25 ), Land )
        , ( ( 15, 26 ), Land )
        , ( ( 15, 27 ), Land )
        , ( ( 15, 28 ), Land )
        , ( ( 16, 18 ), Land )
        , ( ( 16, 27 ), Land )
        , ( ( 16, 28 ), Land )
        , ( ( 16, 29 ), Land )
        , ( ( 17, 27 ), Land )
        , ( ( 17, 28 ), Land )
        , ( ( 17, 29 ), Land )
        , ( ( 18, 2 ), Land )
        , ( ( 18, 3 ), Land )
        , ( ( 18, 28 ), Land )
        , ( ( 18, 29 ), Land )
        , ( ( 19, 0 ), Land )
        , ( ( 19, 4 ), Land )
        , ( ( 19, 28 ), Land )
        , ( ( 19, 29 ), Land )
        , ( ( 20, 4 ), Land )
        , ( ( 21, 1 ), Land )
        , ( ( 21, 2 ), Land )
        , ( ( 21, 21 ), Land )
        , ( ( 21, 28 ), Land )
        , ( ( 22, 4 ), Land )
        , ( ( 22, 17 ), Land )
        , ( ( 22, 18 ), Land )
        , ( ( 22, 19 ), Land )
        , ( ( 22, 20 ), Land )
        , ( ( 22, 21 ), Land )
        , ( ( 22, 22 ), Land )
        , ( ( 22, 23 ), Land )
        , ( ( 23, 3 ), Land )
        , ( ( 23, 16 ), Land )
        , ( ( 23, 17 ), Land )
        , ( ( 23, 18 ), Land )
        , ( ( 23, 19 ), Land )
        , ( ( 23, 20 ), Land )
        , ( ( 23, 21 ), Land )
        , ( ( 23, 22 ), Land )
        , ( ( 23, 23 ), Land )
        , ( ( 24, 1 ), Land )
        , ( ( 24, 2 ), Land )
        , ( ( 24, 5 ), Land )
        , ( ( 24, 6 ), Land )
        , ( ( 24, 10 ), Land )
        , ( ( 24, 14 ), Land )
        , ( ( 24, 15 ), Land )
        , ( ( 24, 17 ), Land )
        , ( ( 24, 18 ), Land )
        , ( ( 24, 19 ), Land )
        , ( ( 24, 20 ), Land )
        , ( ( 24, 22 ), Land )
        , ( ( 24, 26 ), Land )
        , ( ( 25, 4 ), Land )
        , ( ( 25, 5 ), Land )
        , ( ( 25, 6 ), Land )
        , ( ( 25, 13 ), Land )
        , ( ( 25, 14 ), Land )
        , ( ( 25, 17 ), Land )
        , ( ( 25, 18 ), Land )
        , ( ( 26, 7 ), Land )
        , ( ( 26, 12 ), Land )
        , ( ( 26, 13 ), Land )
        , ( ( 26, 14 ), Land )
        , ( ( 26, 24 ), Land )
        , ( ( 26, 29 ), Land )
        , ( ( 27, 3 ), Land )
        , ( ( 27, 4 ), Land )
        , ( ( 27, 5 ), Land )
        , ( ( 27, 6 ), Land )
        , ( ( 27, 7 ), Land )
        , ( ( 27, 11 ), Land )
        , ( ( 27, 12 ), Land )
        , ( ( 27, 18 ), Land )
        , ( ( 27, 29 ), Land )
        ]
