class GameController < ApplicationController
    def home
        @curr_board = session[:board]
        @curr_player = session[:player]
        
        if (@curr_player == "X")
            prev_player = "O"
        else
            prev_player = "X"
        end
        
        if @curr_board.nil?
            @curr_board = [["", "", ""]] * 3
        end
        
        #all we need to keep track of is the current player
        #@player is "X" or "O", "X" goes first
        if @curr_player.nil?
            @curr_player = "X"
        end
        
        #victory condition for person who just moved
        @victor = victory_cond(@curr_board, prev_player)
        
        #simple test for function inputs
        #@y = add(1, 2)
        
        #understand whos turn to process, or if the game ended
        if @victor == "ongoing"
            if @curr_player == "X"
                #this is human player, by defn
                #player_move is only after we submit the form -- if we run it here, there's nothing submitted to params
                render("/index.html.erb")
            elsif @curr_player == "O"
                computer_move
            end
        else
            #we stop the game -- no more moves
            render("/index.html.erb")
        end

    end
    
    def victory_cond(board, player)
                
        #check victory condition
        #X wins or O wins
        
        winner = "ongoing"
        
        #8 ways to win -- 3 horizontal, 3 vertical, 2 diagonal
        
        #check horizontal victory
        
        for i in (0..2) do
            #for rows
            if ((board[i][0] == player) && (board[i][1] == player) && (board[i][2] == player))
                winner = player + " wins!"
            end
        end
        
        #check vertical victory
        for j in (0..2) do
            #for columns
            if ((board[0][j] == player) && (board[1][j] == player) && (board[2][j] == player))
                winner = player + " wins!"
            end
        end
        
        #check upleft downright diagonal victory
        if ((board[0][0] == player) && (board[1][1] == player) && (board[2][2] == player))
            winner = player + " wins!"
        end
    
        #check downleft upright diagonal victory
        if ((board[2][0] == player) && (board[1][1] == player) && (board[0][2] == player))
            winner = player + " wins!"   
        end
        
        #try to avoid setting instance variables or global variables
        #each method (or function) should have a return, by default Ruby
        #returns the last line
        return winner
    end
    
    #simple test function below to see if we can write functions that are callalbe
    def add(num_1, num_2)
       @result = num_1 + num_2
        
    end
    
    def restart
        session[:board] = [["", "", ""]] * 3
        session[:player] = nil
        redirect_to("/")
    end
    
    def computer_move
        #we code the computer to always play "O"
        
        #we use minimax strategy
        
        #first build super simple AI -- find first available space to play O
        
        curr_board = session[:board]
        
        #puts "hello"
        
        #my issue is that there is nothing being saved
        #break exits from if statements and from one loop, not from every loop
        #explore a for loop or  while loop -- create one array
        # of all the stuff in the board, find the index of the first available 
        # blank space and write an O in there -- make sure we write the O!
        
        i = 0
        
        for i in (0..2).to_a do
            if (curr_board[i][0] == "")
                curr_board[i][0] = "O"
                break
            elsif (curr_board[i][1] == "")
                curr_board[i][1] = "O"
                break
            elsif (curr_board[i][2] == "")
                curr_board[i][2] = "O"
                break
            end
        end
        
        #place O in first available space
#        curr_board.each do |row|
#            puts "yargh"
#            row.each do |space|
#                if space == ""
#                    space = "O"
                    #halt after play 1 move
#                    break
#                end
#            end
#        end
        
        session[:board] = curr_board
        
        #switch to human move
        session[:player] = "X"                
        redirect_to("/")

    end
    
    def player_move
        #needs to take in a button, cookies to keep track of what moves have been made
        #also need to check victory condition each turn
        
        #this is the tile the player has selected
        square0 = params.fetch("0").to_s.upcase
        square1 = params.fetch("1").to_s.upcase
        square2 = params.fetch("2").to_s.upcase
        square3 = params.fetch("3").to_s.upcase
        square4 = params.fetch("4").to_s.upcase
        square5 = params.fetch("5").to_s.upcase
        square6 = params.fetch("6").to_s.upcase
        square7 = params.fetch("7").to_s.upcase
        square8 = params.fetch("8").to_s.upcase
        
        #store all moves as a new array
        curr_board = [[square0, square1, square2], [square3, square4, square5], [square6, square7, square8]]
        
        #we store all the boards as an array
        
        #we use 0 to signify available squares, 1 player 1 squares, 2 player 2 squares
        
        #previous board, this is an array
        prev_board =session[:board]
        
        #if this is a new game
        if prev_board.nil?
            session[:board] = curr_board
        else
            #note that curr_board has only one 1, everything else is 0 -- we can use OR statement (i.e. 1 or 0 is 1 -- we preserve all the prev moves.)
            #for each row
            for i in (0..2) do
                #for columns
                for j in (0..2) do
                    if (prev_board[i][j] == "" && curr_board[i][j] == "")
                        curr_board[i][j] = ""
                    elsif ((prev_board[i][j] == "X" && curr_board[i][j] == "") || (prev_board[i][j] == "O" && curr_board[i][j] == ""))
                        curr_board[i][j] = prev_board[i][j]
                    elsif ((prev_board[i][j] == "" && curr_board[i][j] == "X") || (prev_board[i][j] == "" && curr_board[i][j] == "O"))
                        curr_board[i][j] = curr_board[i][j]    
                    end
                end
            end
            session[:board] = curr_board
        end                
        #switch to computer move
        session[:player] = "O"
        redirect_to("/")
    
    end
    
    
end