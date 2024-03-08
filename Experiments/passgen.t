%PassGen v1.1
%Author: Matt Waldeck
%Written: 2024-03-06
%Last update: 2024-03-07

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A very simple random password generator. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variables
var random : int
var character : string
var password : string
var count : int
var strength : int
var strength_check : boolean

%Initialization
strength_check := false
password := ""
count := 0

%Ask how long they want the password to be.
loop
    put "How many characters would you like your password to be?"
    put "A minimum of 10 characters is recommended. Maximum is 255."
    get strength
    
    %This little block just ensures the value supplied is less than 255.
    %This ensures it won't cause a buffer overflow.
    if strength < 256 then
	strength_check := true
    end if
    
    %When the user passes their strength check, the program proceeds.
    cls
    exit when strength_check = true
end loop

put "Generating password..."

loop
    randint (random,1,90)
    case random of 
	label 1: character := 'A'
	label 2: character := 'B'
	label 3: character := 'C'
	label 4: character := 'D'
	label 5: character := 'E'
	label 6: character := 'F'
	label 7: character := 'G'
	label 8: character := 'H'
	label 9: character := 'I'
	label 10: character := 'J'
	label 11: character := 'K'
	label 12: character := 'L'
	label 13: character := 'M'
	label 14: character := 'N'
	label 15: character := 'O'
	label 16: character := 'P'
	label 17: character := 'Q'
	label 18: character := 'R'
	label 19: character := 'S'
	label 20: character := 'T'
	label 21: character := 'U'
	label 22: character := 'V'
	label 23: character := 'W'
	label 24: character := 'X'
	label 25: character := 'Y'
	label 26: character := 'Z'
	label 27: character := 'a'
	label 28: character := 'b'
	label 29: character := 'c'
	label 30: character := 'd'
	label 31: character := 'e'
	label 32: character := 'f'
	label 33: character := 'g'
	label 34: character := 'h'
	label 35: character := 'i'
	label 36: character := 'j'
	label 37: character := 'k'
	label 38: character := 'l'
	label 39: character := 'm'
	label 40: character := 'n'
	label 41: character := 'o'
	label 42: character := 'p'
	label 43: character := 'q'
	label 44: character := 'r'
	label 45: character := 's'
	label 46: character := 't'
	label 47: character := 'u'
	label 48: character := 'v'
	label 49: character := 'w'
	label 50: character := 'x'
	label 51: character := 'y'
	label 52: character := 'z'
	label 53: character := '1'
	label 54: character := '2'
	label 55: character := '3'
	label 56: character := '4'
	label 57: character := '5'
	label 58: character := '6'
	label 59: character := '7'
	label 60: character := '8'
	label 61: character := '9'
	label 62: character := '0'
	label 63: character := '!'
	label 64: character := '@'
	label 65: character := '#'
	label 66: character := '$'
	label 67: character := '%'
	label 68: character := '&'
	label 69: character := '*'
	label 70: character := '('
	label 71: character := ')'
	label 72: character := '-'
	label 73: character := '_'
	label 74: character := '='
	label 75: character := '+'
	label 76: character := '['
	label 77: character := ']'
	label 78: character := '{'
	label 79: character := '}'
	label 80: character := '<'
	label 81: character := '>'
	label 82: character := ','
	label 83: character := '.'
	label 84: character := '/'
	label 85: character := '?'
	label 86: character := '|'
	label 87: character := ';'
	label 88: character := ':'
	label 89: character := '`'
	label 90: character := '~'
    end case
    
    %Add the new character to the password variable.
    password := password + character
    
    %Keep track of how many times the rng has looped.
    %Exit once it matches however many characters the user wanted.
    count := count + 1
    exit when count = strength
end loop

%Display random password to the user.
cls
put "Your random password is:"
put password
