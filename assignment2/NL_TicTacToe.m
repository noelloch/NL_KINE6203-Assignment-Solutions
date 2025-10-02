% Noel Locher 10/1/25 
% Tic Tac Toe!!
% This code runs a game of Tic Tac Toe in the command window. The board 
% starts with a matrix of zeros and the player moves as a 1 and the 
% computer moves as a 2. 

while true
    disp('Welcome to Tic Tac Toe!')
    disp('Would you like to play?')
    prompt = ('Type Y or N: ');
    playAnswer = input(prompt,"s");
    board = zeros(3,3);
% if the player answers 'N' as no the loop breaks and says goodbye. 
% othewise the board is displayed
    if playAnswer == "N"
        disp('Goodbye :(')
        break
    else
        disp(board)
        disp('player goes first (1), computer is next (2)')
    end

    moveCount = 0;
    %starts a loop for the game
    while playAnswer == "Y"
        %initiates the player move
        disp('Player move')
        row = input('Row (1-3): ');
        col = input('Column (1-3): ');
% this prevents any invalid moves
        if row < 1 || row > 3 || col < 1 || col > 3 || board(row, col) ~= 0
            disp('Invalid move. Try again.');
            continue
        % move count is incorporated to decide a draw
        else
            board(row, col) = 1;
            moveCount = moveCount + 1;
        end
        disp(board)

        % Check if the player wins. Calls in the win function at the bottom 
        % of the code.
        if checkWin(board, 1)
            disp('You won!')
            break
        elseif moveCount == 9
            disp('It''s a draw!')
            break
        end

% Computer move
% Copilot assisted with creating the computer move. The screen will 
% display 'computer move'. It finds what cells are empty, which is any on 
% the board with a 0. Converts the idx into rows and columns. Places a 2 in
% the random empty space.
        disp('Computer moves')
        emptyCells = find(board == 0);
        idx = emptyCells(randi(length(emptyCells)));
        [r, c] = ind2sub(size(board), idx);
        board(r, c) = 2;
        moveCount = moveCount + 1;
        disp(board)

        % Check for a computer win. Calls on the win function at the bottom
        % of the code.
        if checkWin(board, 2)
            disp('Computer wins!')
            break
        elseif moveCount == 9
            disp('It''s a draw!')
            break
        end
    end

    % Ask the player to restart. If Y the loop will restart and they
    % can play again
    playAgain = input('Would you like to play again? Type Y or N: ', "s");
    if playAgain ~= "Y"
        disp('You are lame. Goodbye.')
        break
    end
end

% Win check function. This function only exists inside this script. 
function win = checkWin(board, player)
    win = false;
    for i = 1:3
        % this checks first if any rows contain the players number all the 
        % way across, then checks if any columns contain the players number
        % all the way down. If either does it means a win has occured.
        if all(board(i,:) == player) || all(board(:,i) == player)
            win = true;
            return
        end
    end
    %this checks if either diagonal contains the players number in all
    %spots
    if all(diag(board) == player) || all(diag(flipud(board)) == player)
        win = true;
    end
end
