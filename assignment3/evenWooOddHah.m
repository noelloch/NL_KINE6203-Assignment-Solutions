function result = evenWooOddHah(num1,num2)
% this function takes 2 input numbers and has one output. if the sum of the
% numbers is even, 'Woo' is displayed. if the sum is odd, 'Hah' is displayed
    if mod(num1 + num2, 2) == 0 % this finds the remainder after division
    result = 'Woo'; % if remainder is 0 results is an even number
    else 
    result = 'Hah'; % if not a remainder of 0, result is Hah
    end
end 