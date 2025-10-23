function counter(a, b)
% takes 2 number inputs and displays a counter from the smaller number to
% the larger one
if a<b % if the first input is smaller than the second
    for i = [a:b]
    disp(i) % display the numbers from a to b
    end 
elseif b<a % or if the second number is smaller than the first number
    for i = [b:a]
        disp(i) % displays numbers from b to a
    end
end
