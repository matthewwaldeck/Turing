%Necrollmancer v2.1
%Author: Matt Waldeck
%Written: 2024-08-19
%Last update: 2024-08-19

%%%%%%%%%%%%%%%%%%%%%%%%
% Let the dice decide. %
%%%%%%%%%%%%%%%%%%%%%%%%

%Variable declaration.
var input : string
var sides : int := 0
var random : int
var grammarIsHard : string

loop
    %Get input from user.
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
    delay (1000)
    cls
    exit when sides > 0
end loop

%RNG between 1 and var "sides" from user input.
put "Rolling a " + input + "..."
randint (random,1,sides)

%Grammar is hard.
case random of
    label 8,11,18,80,81,82,83,84,85,86,87,88,89 : grammarIsHard := "an "
    label : grammarIsHard := "a "
end case

%Output.
put "You rolled " + grammarIsHard + intstr(random) + "."
