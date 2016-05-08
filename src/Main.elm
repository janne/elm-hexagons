import Element exposing (..)
import List
import Tiles exposing (..)

line : Int -> Int -> List Element -> Element
line line layer elements =
  let
    x = if line % 2 == 0 then 0 else 32
    y = 100 + 49 * line - layer * 21
  in
    container 640 480 (topLeftAt (absolute x) (absolute y)) <| flow right elements

map : Element
map =
  let
    e = spacer 65 100
    t = tile "tileGrass" midBottom
    tf = layers [ tile "tileGrass" midBottom, tile "flowerBlue" middle ]
    ty = layers [ tile "tileGrass" midBottom, tile "flowerYellow" middle ]
    s = tile "tileStone_full" midBottom
    r = tile "tileRock" midBottom
    ws = opacity 0.9 <| tile "tileWater_shadow" midBottom
    tree = tile "pineGreen_high" midTop
    tree' = tile "treeGreen_low" midTop
    w =  opacity 0.9 <| tile "tileWater" midBottom
    combined = layers [ r, tile "alienBeige" midTop ]
  in
    container 1024 768 middle <|
      layers [
        line 0 0 [ r, t, t, t, t, t, r, t, ty ],
        line 0 1 [ e, t, t, t, t, t, r, t, ty ],
        line 0 2 [ e, e, s, e, e, e, e, e, e ],
        line 0 3 [ e, e, s, e, e, e, e, e, e ],
        line 0 4 [ e, e, r, e, e, e, e, e, e ],
        line 1 0 [ t, t, t, t, tf, t, t, t, t ],
        line 1 1 [ t, t, t, t, tf, t, t, t, t ],
        line 1 2 [ e, e, r, r, e, e, e, e, tree' ],
        line 2 0 [ w, ws, ws, t, t, tf, t, t, r ],
        line 2 1 [ e, e, e, e, e, e, e, tree', e, e ],
        line 3 0 [ w, w, w, t, t, t, t, r, combined ],
        line 3 1 [ e, e, e, e, e, tree, e, e, e, e ]
      ]

main =
  Element.toHtml map

