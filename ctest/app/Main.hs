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

conca seconds = show (quot seconds 60)  ++":"++ show (rem seconds 60) 


clock seconds =
    text (conca seconds) --quot seconds 60 --conca seconds
    |> color red
    |> translate (-50) 50

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
           hand (seconds*30),
           hand (seconds*0.5),
           clock (seconds*30),
           hub
         ]
