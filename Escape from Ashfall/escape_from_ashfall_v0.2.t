%Escape from Ashfall v0.2
%Written by Matt Waldeck on 2023-06-06
%Last Updated 2023-06-07

%This is a simple fantasy-themed, text-based adventure game.
%Credit for themeing assistance goes to Justin Calleja.

%Variables
var playerName : string
var reason : string
var dead : boolean
var infection : boolean
var stuffs : int %Convert to array.
var rng : int
var action : string
var proceed : boolean

%Tracking and inventory
dead := false
stuffs := 0
procedure inventory
    cls
    case stuffs of
	label 0 : put "You have nothing on you."
	label 1 : put "You have a spring from your bed."
    end case
    delay (2000)
end inventory

%Selects a random reason for your imprisonment.
randint (rng, 0, 2)
case rng of
    label 0 :
	reason := "You are here for reasons unfair to your kind."
    label 1 :
	reason := "You have been locked away for speaking your mind."
    label 2 :
	reason := "You are behind bars for the safety of the townspeople."
end case

%Ask for player name, and run introduction.
put "What is your name?"
get playerName
cls

put "Welcome, " + playerName + ". You find yourself locked in a dungeon residing in"
put "the outskirts of Ashfall Barrow, a small town in the northern"
put "regions of TBD."
put ""
put reason %random reason for imprisonment each time.
put ""


loop    %%%%%%%%%% ROOM 1 %%%%%%%%%%
    put "Your cell door is in front of you, your bed to your right, and a blank"
    put "wall to your left. There is a small barred window behind you, about 2"
    put "meters off the ground. What would you like to do?"
    put ""
    
    proceed := false
    get action :*
    action := Str.Lower (action)
    put ""
    if action = "inventory" then
	%Check inventory.
	inventory
    elsif index (action, "window") > 0 then
	%Anything to do with the window will display this message.
	proceed := false
	put "The window is very securely set in the bricks that make"
	put "up your cell wall.." 
    elsif index (action, "bed") > 0 then
	%Get the spring.
	stuffs := 1
	put "You search the bed, and find a spring."
    elsif index (action, "wall") > 0 then
	%If you have the spring, die. If not, stare at a wall.
	%Add a check for the word "look", whch will mean you don't die.
	%In later versions, this infection may be a later cause of death.
	if (stuffs = 1) then
	    put "You use the spring to dig away the grout around the bricks."
	    delay (2000)
	    put "You hurt your hand scraping away the rock. It becomes infected."
	    %infection := true
	    delay (2000)
	    put "You have died."
	    delay (2000)
	    dead := true
	else
	    put "You take a closer look at the brick wall."
	    delay (1000)
	    put "With some work, a hole might be possible."
	end if
    elsif index (action, "door") > 0 then
	if (stuffs = 1) then
	    proceed := true
	    put "You take a look at the locking mechanism for the door."
	    put ""
	    delay (2000)
	    put "You might be able to use the spring you found in the"
	    put "bed earlier. You bend the spring to resemble a lockpick..."
	    put ""
	    delay (2000)
	    put "and try it in the lock..."
	    put ""
	    delay (5000)
	    put "Success!"
	    delay (1000)
	else
	    put "You look over the sturdy metal door. No way you're"
	    put "getting through that without either a lockpick or some acid."
	end if
    else
	put "This is not an option right now."
    end if
    delay (3000)
    cls
    
    if (dead = true) then
	quit
    else
	exit when proceed = true
    end if
end loop


loop    %%%%%%%%%% ROOM 2 %%%%%%%%%%
    put "you hear the lock click open and slowly push the door free"
    put "of it's frame. It creaks open, and you hear someone start"
    put "walking towards you to investigate the noise..."
    
    proceed := false
    get action
    exit when proceed = true
end loop

put ""
put "You made it past the first room. W00t."
put "Please stay tuned for more exposition."
