function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Noel Locher
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

% Bug found: Ran the code and any number I input said it was not a 
% valid level selection. || operator changed to &&. 
while level ~= beginner && level ~= moderate && level ~= advanced 
fprintf('Sorry, that is not a valid level selection.\n')         
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner %Bug found: I found this by trying to run the code and getting a incorrect use of '=' error message.                      

    highest = beginnerHighest;

elseif level == moderate

    highest = moderateHighest;

else
    highest = advancedHighest; 
% Bug found: advancedhighest was changed to advancedHighest. Caught this by
% choosing the advanced option to play and the code said an error in line
% 63.
end

% randomly select secret number between 1 and highest for level of play

%Bug found: Secret number generated was always the highest number. Found by
%playing. Code was rewriten to correctly generate a random number.
secretNumber = randi([1, highest]);     

% initialize number of guesses and User_guess

% Bug found: numOfTries was initially set to 1. Changed it to 0 to reflect
% actual number of tries. Found this at the end of the game when it told me
% the number of tries I took and it told me 1 more try than the actual.
% Read the code to find possible error. 
numOfTries = 0;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber % Bug found: This while statement did not
        % have an end. This was found from the code issues panel. The
        % initial coded end was ending the if statement instead of the
        % intended while loop. End was added near the end of the code to
        % end all conditionals and loops.

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');

while userGuess < 1 || userGuess > highest 
% Bug found: input highest number and was told not a valid guess. Changed
% >= to >.
fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

% Bug found: This bug was found from an error message in the   
    % code issues panel. The bug is a repeat of conditions in the if 
    % statement, therefore the statement would never be reached. The if 
    % statement had > when the sign needed to be <.
    if userGuess < secretNumber
        fprintf('Sorry, %d is too low.\n', userGuess);
    elseif userGuess > secretNumber 
        fprintf('Sorry, %d is too high.\n', userGuess);
    elseif numOfTries == 1
        fprintf('\nLucky You!  You got it on your first try!\n\n');
    else
    % Bug found: Display message did not show the number of tries. Found
    % this when completing the game and message appeared. Added numOfTries
    % to the end.
        fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
        secretNumber, numOfTries);
    end

% Bug found: while loop initially ended after 'Game Over.' so the string
% would be stated after every guess. Moved the end to above the game over
% statement.
end % of guessing while loop


fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

% end of game