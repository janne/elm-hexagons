module Tiles exposing (tile)

import Dict exposing (Dict, fromList)
import Element exposing (..)

-- alienBeige alienBlue alienGreen alienPink alienYellow
-- bushAutumn bushDirt bushGrass bushMagic bushSand bushSnow
-- flowerBlue flowerGreen flowerRed flowerWhite flowerYellow
-- hillAutumn hillDirt hillGrass hillMagic hillSand hillSnow
-- pineAutumn_high pineAutumn_low pineAutumn_mid pineBlue_high pineBlue_low pineBlue_mid pineGreen_high pineGreen_low pineGreen_mid
-- rockDirt rockDirt_moss1 rockDirt_moss2 rockDirt_moss3 rockSnow_1 rockSnow_2 rockSnow_3 rockStone rockStone_moss1 rockStone_moss2 rockStone_moss3
-- smallRockDirt smallRockGrass smallRockSnow smallRockStone
-- tileAutumn tileAutumn_full tileAutumn_tile
-- tileDirt tileDirt_full tileDirt_tile
-- tileGrass tileGrass_full tileGrass_tile
-- tileLava tileLava_full tileLava_tile
-- tileMagic tileMagic_full tileMagic_tile
-- tileRock tileRock_full tileRock_tile
-- tileSand tileSand_full tileSand_tile
-- tileSnow tileSnow_full tileSnow_tile
-- tileStone tileStone_bridge tileStone_full tileStone_tile
-- tileWater tileWater_full tileWater_shadow tileWater_tile
-- tileWood_bridge
-- treeAutumn_high treeAutumn_low treeAutumn_mid
-- treeBlue_high treeBlue_low treeBlue_mid
-- treeCactus_1 treeCactus_2 treeCactus_3
-- treeGreen_high treeGreen_low treeGreen_mid
-- waveLava waveWater

tile : String -> Position -> Element
tile name pos =
  let
    coord = Dict.get name tileDict
  in
    container 64 110 pos <|
      case coord of
        Just c ->
          croppedImage (c.x, c.y) c.width c.height "/images/tiles.png"
        Nothing ->
          croppedImage (0, 178) 65 89 "/images/tiles.png"

-- MODEL

type alias TileCoord = {
  x : Int,
  y : Int,
  width : Int,
  height : Int
}

tileDict : Dict String TileCoord
tileDict =
  Dict.fromList
    [
      ( "alienBeige", { x = 380, y = 0, width = 40, height = 66 }),
      ( "alienBlue", { x = 420, y = 0, width = 40, height = 66 }),
      ( "alienGreen", { x = 380, y = 66, width = 40, height = 66 }),
      ( "alienPink", { x = 420, y = 66, width = 40, height = 66 }),
      ( "alienYellow", { x = 425, y = 404, width = 40, height = 60 }),
      ( "bushAutumn", { x = 409, y = 132, width = 15, height = 20 }),
      ( "bushDirt", { x = 168, y = 465, width = 15, height = 20 }),
      ( "bushGrass", { x = 168, y = 445, width = 15, height = 20 }),
      ( "bushMagic", { x = 450, y = 464, width = 15, height = 20 }),
      ( "bushSand", { x = 168, y = 485, width = 15, height = 20 }),
      ( "bushSnow", { x = 409, y = 152, width = 15, height = 20 }),
      ( "flowerBlue", { x = 183, y = 445, width = 12, height = 11 }),
      ( "flowerGreen", { x = 380, y = 165, width = 12, height = 11 }),
      ( "flowerRed", { x = 392, y = 165, width = 12, height = 11 }),
      ( "flowerWhite", { x = 183, y = 467, width = 12, height = 11 }),
      ( "flowerYellow", { x = 183, y = 456, width = 12, height = 11 }),
      ( "hillAutumn", { x = 326, y = 495, width = 33, height = 12 }),
      ( "hillDirt", { x = 326, y = 483, width = 33, height = 12 }),
      ( "hillGrass", { x = 260, y = 495, width = 33, height = 12 }),
      ( "hillMagic", { x = 293, y = 495, width = 33, height = 12 }),
      ( "hillSand", { x = 260, y = 483, width = 33, height = 12 }),
      ( "hillSnow", { x = 293, y = 483, width = 33, height = 12 }),
      ( "pineAutumn_high", { x = 486, y = 211, width = 30, height = 99 }),
      ( "pineAutumn_low", { x = 460, y = 0, width = 30, height = 79 }),
      ( "pineAutumn_mid", { x = 495, y = 411, width = 30, height = 101 }),
      ( "pineBlue_high", { x = 426, y = 264, width = 30, height = 99 }),
      ( "pineBlue_low", { x = 456, y = 264, width = 30, height = 79 }),
      ( "pineBlue_mid", { x = 495, y = 310, width = 30, height = 101 }),
      ( "pineGreen_high", { x = 488, y = 79, width = 30, height = 99 }),
      ( "pineGreen_low", { x = 458, y = 132, width = 30, height = 79 }),
      ( "pineGreen_mid", { x = 465, y = 343, width = 30, height = 101 }),
      ( "rockDirt", { x = 316, y = 178, width = 55, height = 62 }),
      ( "rockDirt_moss1", { x = 0, y = 445, width = 56, height = 62 }),
      ( "rockDirt_moss2", { x = 260, y = 302, width = 56, height = 62 }),
      ( "rockDirt_moss3", { x = 260, y = 240, width = 56, height = 62 }),
      ( "rockSnow_1", { x = 260, y = 364, width = 56, height = 62 }),
      ( "rockSnow_2", { x = 325, y = 0, width = 55, height = 62 }),
      ( "rockSnow_3", { x = 316, y = 359, width = 55, height = 62 }),
      ( "rockStone", { x = 316, y = 297, width = 55, height = 62 }),
      ( "rockStone_moss1", { x = 56, y = 445, width = 56, height = 62 }),
      ( "rockStone_moss2", { x = 112, y = 445, width = 56, height = 62 }),
      ( "rockStone_moss3", { x = 260, y = 178, width = 56, height = 62 }),
      ( "smallRockDirt", { x = 392, y = 478, width = 29, height = 33 }),
      ( "smallRockGrass", { x = 488, y = 178, width = 29, height = 33 }),
      ( "smallRockSnow", { x = 421, y = 478, width = 29, height = 33 }),
      ( "smallRockStone", { x = 380, y = 132, width = 29, height = 33 }),
      ( "tileAutumn", { x = 65, y = 267, width = 65, height = 89 }),
      ( "tileAutumn_full", { x = 65, y = 178, width = 65, height = 89 }),
      ( "tileAutumn_tile", { x = 316, y = 240, width = 55, height = 57 }),
      ( "tileDirt", { x = 65, y = 0, width = 65, height = 89 }),
      ( "tileDirt_full", { x = 0, y = 356, width = 65, height = 89 }),
      ( "tileDirt_tile", { x = 260, y = 426, width = 55, height = 57 }),
      ( "tileGrass", { x = 0, y = 178, width = 65, height = 89 }),
      ( "tileGrass_full", { x = 0, y = 89, width = 65, height = 89 }),
      ( "tileGrass_tile", { x = 315, y = 426, width = 55, height = 57 }),
      ( "tileLava", { x = 130, y = 267, width = 65, height = 89 }),
      ( "tileLava_full", { x = 195, y = 241, width = 65, height = 89 }),
      ( "tileLava_tile", { x = 371, y = 176, width = 55, height = 57 }),
      ( "tileMagic", { x = 0, y = 0, width = 65, height = 89 }),
      ( "tileMagic_full", { x = 0, y = 267, width = 65, height = 89 }),
      ( "tileMagic_tile", { x = 325, y = 62, width = 55, height = 57 }),
      ( "tileRock", { x = 65, y = 89, width = 65, height = 89 }),
      ( "tileRock_full", { x = 65, y = 356, width = 65, height = 89 }),
      ( "tileRock_tile", { x = 371, y = 233, width = 55, height = 57 }),
      ( "tileSand", { x = 130, y = 0, width = 65, height = 89 }),
      ( "tileSand_full", { x = 130, y = 89, width = 65, height = 89 }),
      ( "tileSand_tile", { x = 371, y = 290, width = 55, height = 57 }),
      ( "tileSnow", { x = 130, y = 178, width = 65, height = 89 }),
      ( "tileSnow_full", { x = 195, y = 419, width = 65, height = 89 }),
      ( "tileSnow_tile", { x = 370, y = 421, width = 55, height = 57 }),
      ( "tileStone", { x = 260, y = 0, width = 65, height = 89 }),
      ( "tileStone_bridge", { x = 195, y = 0, width = 65, height = 76 }),
      ( "tileStone_full", { x = 130, y = 356, width = 65, height = 89 }),
      ( "tileStone_tile", { x = 325, y = 119, width = 55, height = 57 }),
      ( "tileWater", { x = 195, y = 76, width = 65, height = 89 }),
      ( "tileWater_full", { x = 260, y = 89, width = 65, height = 89 }),
      ( "tileWater_shadow", { x = 195, y = 330, width = 65, height = 89 }),
      ( "tileWater_tile", { x = 371, y = 347, width = 55, height = 57 }),
      ( "tileWood_bridge", { x = 195, y = 165, width = 65, height = 76 }),
      ( "treeAutumn_high", { x = 525, y = 285, width = 27, height = 107 }),
      ( "treeAutumn_low", { x = 518, y = 87, width = 27, height = 87 }),
      ( "treeAutumn_mid", { x = 552, y = 261, width = 27, height = 107 }),
      ( "treeBlue_high", { x = 525, y = 392, width = 27, height = 107 }),
      ( "treeBlue_low", { x = 544, y = 174, width = 27, height = 87 }),
      ( "treeBlue_mid", { x = 545, y = 0, width = 27, height = 107 }),
      ( "treeCactus_1", { x = 426, y = 132, width = 32, height = 66 }),
      ( "treeCactus_2", { x = 465, y = 444, width = 29, height = 66 }),
      ( "treeCactus_3", { x = 426, y = 198, width = 32, height = 66 }),
      ( "treeGreen_high", { x = 552, y = 368, width = 27, height = 107 }),
      ( "treeGreen_low", { x = 518, y = 0, width = 27, height = 87 }),
      ( "treeGreen_mid", { x = 517, y = 178, width = 27, height = 107 }),
      ( "waveLava", { x = 359, y = 493, width = 33, height = 10 }),
      ( "waveWater", { x = 359, y = 483, width = 33, height = 10 })
    ]
