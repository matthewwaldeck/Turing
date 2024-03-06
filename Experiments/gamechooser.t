%Gamechooser v1.0
%Written by Matt Waldeck
%Last updated 05/06/2023
%Inspired by Ben. A simple exercise in cases with an RNG.

%Set random number
var random : int
var game : string
randint (random,0,5)

%Choose game
case random of
    label 0: game := "Animal Crossing: New Horizons"
    label 1: game := "Legend of Zelda: BOTW"
    label 2: game := "Borderlands"
    label 3: game := "Minecraft"
    label 4: game := "Cities: Skylines"
    label 5: game := "Stardew Valley"
end case

%Display result
%put random
put "You should play " + game + "."
