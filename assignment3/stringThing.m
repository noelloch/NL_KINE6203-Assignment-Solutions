function [strLength, firstChar, lastChar] = stringThing (stringValue)
% this function gives the length of the string variable as well as the
% first and last letters in the string
strLength = strlength(stringValue) % finds the string length
firstChar = stringValue(1) % gets the first character in the string
lastChar = stringValue(end) % gets the last character in the string
end 

