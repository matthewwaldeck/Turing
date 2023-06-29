%Escape from Ashfall v0.3
%Written by Matt Waldeck on 2023-06-06
%Last Updated 2023-06-28

%This is a simple fantasy-themed, text-based adventure game.
%Credit for themeing assistance goes to Justin Calleja.

%Variables
var playerName : string
var reason : string
var stuffs : array 1 .. 2 of string
var gold : int
var rng : int
var action : string
var proceed : boolean

%Variable initialization
gold := 0
proceed := false

%Reset inventory
for i : 1 .. upper(stuffs)
    stuffs(i) := ""
end for

%Inventory check
procedure inventory
    cls
    for i : 1 .. upper(stuffs)
	put stuffs(i)
    end for
    put "Game will resume in 5 seconds..."
    delay (5000)
end inventory

procedure death
    delay (2000)
    put "You have died."
    delay (10000) %replace with "Press key to continue..."
    quit
end death

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
put "regions of Enethor."
put ""
put reason %random reason for imprisonment each playthrough.
put ""
delay (2000)


loop    %%%%%%%%%% ROOM 1 %%%%%%%%%%
    put "Your cell door is in front of you, your bed to your right, and a blank"
    put "wall to your left. There is a small barred window behind you, about 2"
    put "meters off the ground."
    put ""
    put "What do you do?"
    put ""
    
    proceed := false
    get action :*
    action := Str.Lower (action)
    put ""
    if action = "inventory" then
	inventory %Check inventory.
    elsif index (action, "window") > 0 then
	put "The window is very securely set in the bricks that make"
	put "up your cell wall.." 
    elsif index (action, "bed") > 0 then
	put "You search the bed, and find a spring."
	stuffs(1) := "Spring"
    elsif index (action, "wall") > 0 then
	if (stuffs(1) = "Spring") then
	    put "You use the spring to dig away the grout around the bricks."
	    delay (2000)
	    put "You hurt your hand scraping away the rock. It becomes infected."
	    death
	else
	    put "You take a closer look at the brick wall."
	    delay (1000)
	    put "With some work, a hole might be possible."
	    delay (5000)
	end if
    elsif index (action, "door") > 0 then
	if (stuffs(1) = "Spring") then
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
	    put "getting through that without either a lockpick or a saw."
	end if
    else
	put ""
	put "That doesn't seem like a viable way out of this place..."
    end if
    delay (3000)
    cls
    
    exit when proceed = true
end loop


loop    %%%%%%%%%% ROOM 2 %%%%%%%%%%
    put "you hear the lock click open and slowly push the door free"
    put "of it's frame. It creaks open, and you hear footsteps echo"
    put "against the stone walls as someone comes to investigate..."
    put ""
    put "The hallway seems clear the other direction, going deeper"
    put "into the prison... or you may be able to hide in your cell"
    put "until they move on. You could also try to fight."
    put ""
    put "What do you do?"
    put ""
    
    proceed := false
    get action
    if index (action, "hide") > 0 then
	put "You quickly retreat back into your cell, frantically searching"
	put "for a place to hide. You try to squeeze under your bed, being"
	put "careful to avoid splinters and loose springs..."
	put ""
	put "You manage to squeeze against the wall, and hold your breath..."
	put ""
	put "You hear the guard run into the room and draw their sword, the"
	put "metal blade singing as they pull it quickly from it's scabbard..."
	put ""
	delay (2000)
	
	randint (rng, 0, 1) %Coinflip
	case rng of
	    label 0 :
		%Success, the guard leaves.
		proceed := true
		
		put "Luck is on your side, and the guard is too tired to care."
		put "You learn he is male, by the sigh he heaves as he lowers"
		put "his blade.He assumes a draft is to blame for the door swinging"
		put "open, and he turns to leave..."
		delay (1000)
	    label 1 :
		%Failure, the guard finds you and kills you.                
		put "The guard walks into the room with caution, and you feel"
		put "them scanning the room. By the pitch of his breath you can"
		put "tell he's male..."
		put ""
		put "You hold your breath as he makes his way around your cell..."
		put ""
		put "Your eyes widen as he stops beside the bed, his boots mere"
		put "inches from your nose. You see his fingers appear as he"
		put "reaches down to grab the frame, and flips the poorly crafted"
		put "bed on it's end, revealing your hiding spot!"
		put ""
		put "You try to scramble to your feet, but he grabs you before you"
		put "even have a chance to focus on your captor."
		put ""
		put '"On your feet!" the guard yells as he drags you off, deeper'
		put "deeper into the prison. You guess he's taking you to the"
		put "dungeons deep underground. By the screams you've heard coming"
		put "from down this hallway, this will certainly be the last you ever"
		put "see of the sun..."
		death
	end case
    elsif index (action, "run") > 0 then
	put "You trip and knock yourself out!"
	put ""
	put "(This action hasn't been finished yet. Coming in v0.4!"
	death
    elsif index (action, "fight") > 0 then
	%This is an optional step to possibly take their weapon.
	put "You wait behind the wall until your persuer is right beside you."
	delay (750)
	put "You jump at your attacker, and knock them to the ground."
	delay (750)
	put "Their sword clatters across the ground, you clench your fist and"
	put "punch the guard as hard as you can, dazing him long enough for you"
	put "to make a dash for the fallen weapon."
	delay (2000)
	
	randint (rng, 0, 1) %This decides wether you succeed or die.
	case rng of
	    label 0 :
		%You fail.
		put "The guard reovers more quickly than you expected, and grabs"
		put "your ankle as you dive for his sword. He pulls a small dagger"
		put "from his boot and stabs you between your ribs."
		put ""
		put "Since you are no warrior, this takes you out of the fight, and"
		put "he is able to finish you off quickly..."
		put ""
		put "You have died."
		death
	    label 1 :
		%You succeed.
		proceed := true
		stuffs(2) := "Guard's Sword"
		put "you're stronger than you thought, and you manage to break the"
		put "guard's nose. Blood drips to the ground, marking your battle as"
		put "he struggles to stand. You leap for the sword and manage to grab"
		put "the hilt and spring to your feet before he recovers."
		put ""
		put "You swing the weapon at the guard, making contact with his"
		put "chestplate. As he staggers back, still reeling from the pain in"
		put "his nose, you bring the blade between you and shove him against"
		put "the wall. You ask the way out, the threat obvious despite your"
		put "your unstable voice. Clearly you've never interrogated anyone"
		put "before. The guard knows this, but doesn't make enough gold to"
		put "put up a fight."
		put ""
		put "He directs you down the hallway he came from and warns you there"
		put "will be more guards, since the main outpost is up that direction."
		put ""
		put "The guard asks if you will you spare his life..."
		
		get action
		if action = "yes" then
		    put "You release the guard. He thanks you, gives you a gold coin, and"
		    put "goes to sit on a nearby bench. He will not be any further trouble."
		    gold := gold + 1
		else
		    put "You slowly pull your blade across his throat, killing him. As the"
		    put "light leaves his eyes, you feel a pang of regret... but have no time"
		    put "for such emotions. You let his body fall to the floor, and search for"
		    put "anything useful, finding nothing but a few gold pieces."
		    gold := gold + 3
		end if
	    label 2 :
		%You succeed, but with an injury.
		%Coming in future update.
	end case
    else
	put ""
	put "Something in yout gut tells you that's not a good idea..."
    end if
    delay (3000)
    cls
    
    exit when proceed = true
end loop
