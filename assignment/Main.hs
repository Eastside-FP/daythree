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

-- bulk of work

clock :: Float -> Picture
clock seconds =
    text (show (quot (floor seconds) 60)  ++":"++ show (rem (floor seconds) 60) ) 
    |> color cyan
    |> translate (-50) 50

numHand :: Float -> Picture
numHand seconds =
     text (show (rem (floor seconds) 60)) 
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
           face,
           hand (seconds*30), --add features
           hand (seconds*0.5),
           clock (seconds*30),
           numHand (seconds*30),
           numHand (seconds*0.5),
           hub
         ]
