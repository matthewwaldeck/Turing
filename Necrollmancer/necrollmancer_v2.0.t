%Necrollmancer v2.0
%Author: Matt Waldeck
%Written: 2024-08-19
%Last update: 2024-08-19

%%%%%%%%%%%%%%%%%%%%%%%%
% Let the dice decide. %
%%%%%%%%%%%%%%%%%%%%%%%%

%Variable declaration.
var input : string
var sides : int
var random : int
var grammarIsHard : string
 
%Get input from user.
put "What would you like to roll? Default is D20."
put "Options are D4, D6, D8, D10, D12, D20, and D100."
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
    label : sides := 20
end case
 
%RNG between 1 and var "sides" from user input.
put ""
put "Rolling a " + input + "..."
randint (random,1,sides)
 
%Grammar is hard.
if random = 8 then
    grammarIsHard := "an "
elsif random = 11 then
    grammarIsHard := "an "
elsif random = 18 then
    grammarIsHard := "an "
elsif random = 80 then
    grammarIsHard := "an "
elsif random = 81 then
    grammarIsHard := "an "
elsif random = 82 then
    grammarIsHard := "an "
elsif random = 83 then
    grammarIsHard := "an "
elsif random = 84 then
    grammarIsHard := "an "
elsif random = 85 then
    grammarIsHard := "an "
elsif random = 86 then
    grammarIsHard := "an "
elsif random = 87 then
    grammarIsHard := "an "
elsif random = 88 then
    grammarIsHard := "an "
elsif random = 89 then
    grammarIsHard := "an "
else
    grammarIsHard := "a "
end if
 
%Output.
put "You rolled " + grammarIsHard + intstr(random) + "."
