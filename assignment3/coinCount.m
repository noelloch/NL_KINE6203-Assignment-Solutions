function [total] = coinCount(quarters, dimes, nickels, pennies)
% takes 4 inputs of the amount of different types of coins. outputs the
% total change
total = (quarters*0.25)+(dimes*0.10)+(nickels*0.05)+ (pennies*0.01)
% multiplies the number of coins by their value then adds together
end
