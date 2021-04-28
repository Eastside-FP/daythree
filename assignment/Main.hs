module Main where

import Graphics.Gloss

(|>) x f = f x

face =
    circleSolid 350

hub =
    circleSolid 40
    |> color orange

hand seconds multiplier =
    rectangleSolid 5 340
    |> color yellow
    |> translate (-2.5) 170    
    |> rotate (seconds * 6 * multiplier)

numSec seconds multiplier=
    text (show (rem (floor (seconds*multiplier)) 60))
    |> color green
    |> translate (-2.5) 170
    --for some reason couldn't multiply by multiplier twice, so i just manually put it in as 30 instead.
    |> rotate (seconds*6*30)

numMin seconds multiplier=
    text (show (quot (floor seconds*multiplier) 60))
    |> color green
    |> translate (-2.5) 170
    |> rotate (seconds*3)

main :: IO ()

main = animate windowed azure renderer         
    where             
        windowed = InWindow "My Window" (800, 800) (10,10) 
        renderer seconds =
                pictures [
                       face,
                       hand seconds 30,
                       hand seconds 0.5,
                       numSec seconds 30,
                       numMin seconds 30,
                       hub                        
                       ]


