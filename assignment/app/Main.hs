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

-- NOTE: seconds is a float, needed to round (actually floor) it into an integer
conca :: Integer -> String
conca seconds = show (quot seconds 60)  ++":"++ show (rem seconds 60) 

clock :: Float -> Picture
clock seconds =
    text (conca (floor seconds)) --conca seconds
    |> color red
    |> translate (-50) 50

handText :: Float -> Picture
handText seconds =
     text (show (rem (floor seconds) 60)) --conca seconds
    |> color red
    |> translate (-2.5) 170
    |> rotate (seconds * 6)
 

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
           handText (seconds*30),
           handText (seconds*0.5),
           hub
         ]
