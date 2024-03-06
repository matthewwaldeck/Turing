%Reactions v0.1
%Written by Matt Waldeck
%Last updated 05/06/2023

%Variables
var selection : int
var letter : string
var input : array char of boolean

%Select a letter
randint (selection,1,26)
case selection of 
    label 1: letter := 'A'
    label 2: letter := 'B'
    label 3: letter := 'C'
    label 4: letter := 'D'
    label 5: letter := 'E'
    label 6: letter := 'F'
    label 7: letter := 'G'
    label 8: letter := 'H'
    label 9: letter := 'I'
    label 10: letter := 'J'
    label 11: letter := 'K'
    label 12: letter := 'L'
    label 13: letter := 'M'
    label 14: letter := 'N'
    label 15: letter := 'O'
    label 16: letter := 'P'
    label 17: letter := 'Q'
    label 18: letter := 'R'
    label 19: letter := 'S'
    label 20: letter := 'T'
    label 21: letter := 'U'
    label 22: letter := 'V'
    label 23: letter := 'W'
    label 24: letter := 'X'
    label 25: letter := 'Y'
    label 26: letter := 'Z'
end case

%show on screen
put letter

%on button push, validate key
Input.KeyDown (input)
if input = letter then
    put "You nailed it!"
else
    put "You failed."
end if
