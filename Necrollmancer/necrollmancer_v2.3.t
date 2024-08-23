%Necrollmancer v2.3
%Author: Matt Waldeck
%Written: 2024-08-19
%Last update: 2024-08-22

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Let the dice decide your fate. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variable declaration.
var input : string := ""            %Die to roll.
var sides : int := 0                %Number of sides on selected die.
var rolls : int := 0                %Number of dice to roll.
var roll : int := 0                 %RNG storage.
var count : int := 0                %Number of dice rolled so far.
var grammarIsHard : string := ""    %Ensuring proper grammar for final output.
var sum : int := 0                  %Sum of all rolled dice.
var average : real := 0.00          %Average of roll results.
var highest : int := 0              %Highest roll.
var lowest : int := 0               %Lowest roll.

%Get input from user.
loop
    put "Please choose a die to roll. Your options include standard D&D dice:"
    put "D4, D6, D8, D10, D12, D20, and D100."
    get input

    %Convert to uppercase.
    input := Str.Upper(input)

    %Convert input to number of sides.
    case input of
	label "D4": sides := 4
	label "D6": sides := 6
	label "D8": sides := 8
	label "D10": sides := 10
	label "D12": sides := 12
	label "D20": sides := 20
	label "D100": sides := 100
	label : put "Invalid selection."
    end case
    
    if sides = 0 then
	delay (1000)
    end if
    
    cls
    exit when sides > 0
end loop

%Number of dice to roll.
put "How many dice would you like to roll?"
get rolls
var arrRolls : array 0 .. rolls of int
cls

%Grammar.
if rolls = 1 then
    put "Rolling a " + input + "..."
else
    put "Rolling " + intstr(rolls) + " " + input + "s..."
end if

%Time to roll some dice.
loop
    
    %RNG between 1 and var "sides" from user input.
    %Add result to proper array index.
    randint (roll,1,sides)
    arrRolls (count) := roll
    
    count := count +  1
    exit when count = rolls
end loop

%Reset counter for later use.
count := 0
put ""

%Output
loop
    %Grammar is hard.
    case arrRolls(count) of
	label 8,11,18,80,81,82,83,84,85,86,87,88,89 : grammarIsHard := "an "
	label : grammarIsHard := "a "
    end case

    %Display result of roll onscreen.
    put "Roll " + intstr((count+1)) + " is " + grammarIsHard + intstr(arrRolls(count)) + "."
    delay(50)
    count := count + 1
    exit when count = rolls
end loop

count := 0

%If multipe dice were rolled, show some stats.
if rolls > 1 then
    %Calculate sum of rolls.
    loop
	sum := sum + arrRolls(count)
	count := count + 1
	exit when count = rolls
    end loop
    
    %Calculate average of rolls, rounded to two places.
    average := sum / rolls
    
    %Highest value.
    count := 1
    highest := arrRolls(0)
    loop
	if arrRolls(count) > highest then
	    highest := arrRolls(count)
	end if
	count := count + 1
	exit when count = rolls
    end loop
    
    %Lowest value.
    count := 1
    lowest := arrRolls(0)
    loop
	if arrRolls(count) < lowest then
	    lowest := arrRolls(count)
	end if
	count := count + 1
	exit when count = rolls
    end loop
    
    %Write stats to output window.
    put ""
    put "The sum of all rolled dice is " + intstr(sum) + "."
    put "The average of all rolled dice is " + frealstr(average,0,2) + "."
    put "The highest roll was " + intstr(highest) + "."
    put "The lowest roll was " + intstr(lowest) + "."
end if

