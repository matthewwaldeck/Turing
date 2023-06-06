%Escape from Ashfall v0.1
%Written by Matt Waldeck on 06/06/2023
%Last Updated 06/06/2023

%This is a simple fantasy-themed, text-based adventure game.
%Credit for themeing assistance goes to Justin Calleja.

%Variables
var playerName : string
var action : string

%Constants
const town := "Ashfall Barrow"
const region := "REGION"

%Ask for player name, and run introduction.
put "What is your name?"
get playerName

cls
put "Welcome, "+playerName+". You find yourself locked in a dungeon residing in"
put "the outskirts of "+town+", a small town in the northern"
put "regions of "+region+"."
put ""
put "You are here for reasons unfair to your kind." %randomize each time?
put ""
put "Your cell door is in front of you, your bed to your right, and a blank"
put "wall to your left. There is a small barred window behind you, about 2"
put "meters off the ground. What would you like to do?"
put ""

get action

%window is secure. Might remove entirely to seem deeper underground.
%wall shows signs of age, might be able to dig through over time. death?
%Bed is old and uncomfortable. Could maybe search for a rudimentary lockpick.
