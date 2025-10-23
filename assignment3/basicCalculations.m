function [sum, difference, product, maximum] = basicCalculations(num1,num2)
% this function takes an input of 2 numbers. it will output 4 numbers:
%  the sum, difference, product and maximum of the two inputs. 
sum = num1 + num2; % this adds the 2 numbers

if num1 >= num2
    difference = num1 - num2
elseif num2 > num1
    difference = num2 - num1
end 
% the above if statement subtracts the smaller number from the larger one
product = num1 * num2 % multiplied the 2 inputs
maximum = max(num1, num2) % finds the max of the 2 inputs
end 