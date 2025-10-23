function [valid] = validTriangle(a)
% determines if the length of 3 sides creates a valid triangle
% will return 0 if not valid and 1 if it is valid

sort(a) % sorts the input numbers from smallest to largest
sumSides = a(1)+a(2) % two smaller sides are added
valid = sumSides > a(3); % determines validity if the sum of the sides is 
% greater than side 3
end 