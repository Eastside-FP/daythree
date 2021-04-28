module Main where
import Graphics.Gloss


-- forward pipeline
(|>) x f = f x

face = 
  circleSolid 350

hand seconds =
  rectangleSolid 5 340  
  |> color yellow         
  |> translate (-2.5) 170 
  |> rotate (seconds / 30 * 6)

hub =
  circleSolid 40 
  |> color orange 

time seconds = 
  text (show $ mod (floor $seconds / 30) 60)
  |> color red
  |> scale 0.3 0.3
  |> rotate (seconds / 30 * (-6)) -- rotates counterclockwise to keep the numbers upright
  |> translate (-10) 350
  |> rotate (seconds / 30 * 6)

main = 
  animate windowed azure renderer
    where
      windowed = InWindow "My Window" (800, 800) (10, 10)
      renderer seconds = 
        pictures [
           face,

           hand $ seconds * 30,
           hand $ seconds * 30 / 60,

           time $ seconds * 30,
           time $ seconds * 30 / 60,

           hub
         ]
