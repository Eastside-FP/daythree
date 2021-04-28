module Main where
import Graphics.Gloss


-- forward pipeline
(|>) x f = f x

--I'm not entirely sure how to do parts 3 or 4. Below is my best guess, but I'm not sure how to interpret the errors. Apologies--I will try to start earlier and set up a meeting
--if I get stuck next time. 
format seconds = ((String)(seconds / 60) ++ ":" ++ (String)(seconds mod 60))

face = 
  circleSolid 350

hand seconds =
  rectangleSolid 5 340  
  |> color yellow         
  |> translate (-2.5) 170 
  |> rotate (seconds * 6)

hub =
  circleSolid 40 
  |> color orange 

label seconds = 
    text format(seconds)
    |> color red

main = 
  animate windowed azure renderer
    where
      windowed = InWindow "My Window" (800, 800) (10, 10)
      renderer seconds = 
        pictures [
           face,
           hand (seconds * 30),
           hand ((seconds * 30) / 60), 
           label,
           hub
         ]
