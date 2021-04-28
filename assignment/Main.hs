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
  |> rotate (seconds * 6)

--bulk of work bellow



clock :: Float -> Picture
clock seconds =
    text (seconds) 
    |> color blue
    |> translate (-50) 50

Text :: Float -> Picture
Text seconds =
     text (show (seconds*60)) 
    |> color blue
    |> translate (-2.5) 170
    |> rotate (seconds * 6)
 



--

hub =
  circleSolid 40 
  |> color orange 

main = 
  animate windowed azure renderer
    where
      windowed = InWindow "My Window" (800, 800) (10, 10)
      renderer seconds = 
        pictures [
           face,              --add extra features
           hand (seconds*30),
           hand (seconds*0.5),
           clock (seconds*30),
           Text (seconds*30),
           Text (seconds*0.5),
           hub
         ]
