#Things to ask Raghu -- How do I run GDB/debug Segfaults in Ruby and Cloud9? what is the executable that I can run gdb on?

class GameController < ApplicationController

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
    
    def array_dup(given_array)
        #purpose of this function is to clone arrays
        #note that Ruby a = b will assign a pointer to the object -- the object itself is NOT cloned!
        #array.dup will ONLY copy the 1st order array -- i.e. array of arrays will not be copied
        #this will copy everything
        new_array = []
        
        given_array.each do |item|
           if item.class != Array
               new_array.append(item)
           else
               #we run the recursive case - append the array and function on it
               #append arrays is the same as adding
               new_array = new_array + [array_dup(item)]
           end
        end
        
        return(new_array)
        
    end
    
    def avail_moves(board)
        #returns an array of array of available moves
        #main array contains the squares of possible moves, each sub array is the
        #i,jth location of a possible move
        poss_moves = []
        
        for i in (0..2).to_a do
            for j in (0..2).to_a do
                if(board[i][j] == "")
                    poss_moves.push([i, j])
                end
            end
        end
        
        #https://stackoverflow.com/questions/10316495/call-ruby-function-from-command-line
        #call ruby functions from command line
        
        #navigate to the file -- cd app/controllers in terminal
        #change function name to self.avail_moves
        #comment out <ApplicationController
        #run ruby -r "./game_controller.rb" -e "GameController.avail_moves [['', 'X', 'O'], ['', '', 'X'], ['O', '', '']]"
        
        return(poss_moves)
        #sample board
        #sampboard = [['', 'X', 'O'], ['', '', 'X'], ['O', '', '']]
    end
    
    def restart
        session[:board] = [["", "", ""]] * 3
        session[:player] = nil
        redirect_to("/")
    end
    
    def place_piece(board, player, rowindex, colindex)
        #places a piece on the board and updates the board, returns the board
        
        #we assume the move is valid
        
        #player is "X" or "O"
        
        board[rowindex][colindex] = player
        
        return(board)
    end
    
    def player_switch(player)
        #returns the opposite player -- if input is X then output is O
        if(player == "X")
            return("O")
        elsif(player == "O")
            return("X")
        end
    end
    
    #we write a recursive helper function to collapse everything into 1 array
    
    def array_compress(given_array, player)
    #we take an array of array of array ... of array (n nested levels), recursively find the max and min according to the given player
    #the given player we want to find the max score, the opposing player we want to find the min score
    #return the move with the max score at the end
    
        clean_array = []
        
        given_array.each do |object|
            max_min_output = array_compress_helper(object, player)
            clean_array.append(max_min_output)
        end
    
        puts "break"
    
        return(clean_array)
    end
    
    def array_compress_helper(given_object, player)
        #note to self: right now I'm trying to implement minimax -- each level we have to switch what scores we pick (i.e. for O we want to)
        #find the maximum score of the subarray, for X we want to find the minimum score of the subarray
        #right now we have to delve into array_compress_helper -- my idea is to first scan the given subarray to see if it is a "pure" array, or
        #if it has no further subarrays. if so, we find the max or min (according to the player passed)
        #if not, then we recursively call the function on the entire subarray and do a min or max on that function -- the idea is to
        #keep "purifying" arrays at each level and calling the respective max and mins on those purified arrays until we get to the largest
        #purified array
        
        #given object can be an array, can be a fixnum -- gotta check!
        
        #this is simply to collapse all the subarrays down into min or max
        
        #base case is that we get a fixnum, which we simply return that number
        if (given_object.class == Fixnum)
            puts "fixnum"
            return(given_object)
        else
            #we are assuming the only valid inputs that will be passed to array_compress are arrays of Fixnums or Fixnums
            #for arrays, we want to find the max or min according to player
            #flip the player at each time
            if pure_array(given_object) == true
                
                #puts "pure array"
                
                #first we scan if the new_obj is a pure Array or if it has additional Arrays within it
                if player == "O"
                        #we want to maximize the score
                        return(given_object.max)
                    elsif player == "X"
                        #we want to minimize the score
                        return(given_object.min)
                end
            else 
                #Put this off for a few days, work on the rumbler prototype, return to this later
                #IMPORTANT: for some reason, this branch never gets executed
                #This should get executed, since we should be going multiple layers into the scores (more than 1 level)
                #either we aren't going multiple layers in or we're throwing the top layers away
                
                #puts "nonpure array"
                #if new_obj is not a pure Array, we call the function recursively
                new_pure_array = []
                
                given_object.each do |item|
                    #we will create an array to store the non-array items and call array_compress_helper on the array items
                    if item.class == Fixnum
                        new_pure_array.append(item)
                    else
                        new_pure_array.append(array_compress_helper(given_object, player_switch(player)))
                    end
                    
                end
                
                #puts "scores"
                #puts new_pure_array
                #puts "whoooeee"
                
                if player == "O"
                    return(new_pure_array.max)
                else
                    return(new_pure_array.min)
                end
                    
              #  if player == "O"
                    #I suspect what's happening here is that we are chucking out all the non-array values with this recursive call
                    #we need to preserve that array and call .max or .min on the entire subarray
                    #what i think this is doing is it's finding the max or min of the furthest subarray, returning a value, and calling
                    #max or min on that value, which is that same value (max of 1 number is that number)
                    
              #      return(array_compress_helper(given_object, player_switch(player)).max)
              #  elsif player == "X"
              #      return(array_compress_helper(given_object, player_switch(player)).min)
              #  end
                    
            end
        end
    end
    
    def pure_array(given_array)
        #determine if the given array is a pure array (array of Fixnums for now) or it contains arrays of fixnums
        given_array.each do |item|
            if item.class != Fixnum
                return false
            end
        end
        #if all of the items are fixnums, then we return true
        return true
    end
    
    def computer_move_1
        #this is the most basic computer move
        
        #we code the computer to always play "O"
        
        #first build super simple AI -- find first available space to play O
        
        curr_board = session[:board]
        
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
    
    def computer_move_scores(board, player, poss_moves)
        #this takes an array of moves and returns the highest score
        
        #base case -- check if game is over, score based off of that
        if (victory_cond(board, player) == "X wins!")
            #loss for computer if X wins, X is always human
            return(-10)
        elsif (victory_cond(board, player) == "O wins!")
            return(10)
        #if there are no possible moves left (i.e. a draw)
        elsif poss_moves.empty?
            return(0)
        else
            #here we have the recursive case -- we have a list of possible moves
            #we "play" each move, if X then we try to find the lowest possible score,
            #if O then we try to find the highest possible score

            #list of scores for each move -- a new move_scores list is being built with each recursive call
                    
            move_scores = []
            
            #run through list of possible moves, each square stored as array, row stored in 0th pos, col stored in 1st pos
            poss_moves.each do |movearray|
                row_index = movearray[0]
                col_index = movearray[1]
                        
                #create a new board each time we run through a possible move        
                tempboard = array_dup(board)
                
                #we have to put all the scores in an array
                
                move_scores.push(
                    computer_move_scores(
                        #new board -- place piece with current player's piece
                        place_piece(tempboard, player, row_index, col_index), 
                        #swap the player 
                        player_switch(player), 
                        #run again with other player
                        avail_moves(place_piece(board, player_switch(player), row_index, col_index))
                    )
                )
            end

        end
        
        #we now have array of array of array of .... of array of scores, need to clean up to 1 array
        
        #cleaning up to 1 array is systematically picking out the max and mins of the scores according to which player it is
        
        #move_score_clean is an array of just Fixnums of scores
        move_score_clean = array_compress(move_scores, player)
        
        #we return the clean array
        return(move_score_clean)
        
    end
    
    def best_computer_move_2(board, player)
        
        #this uses minimax to find the best computer move and return the best move
                   
        poss_moves_cpu = avail_moves(board)

        #test array of numbers
        #b = [1, 2, 3, [4, 5, 6], [7], [8, 9, 10]]
        
        #get the array of scores
        
        #write a temporary board for computer_move_scores to work on 
        #IMPORTANT: a = b will copy the REFERENCE, NOT THE OBJECT -- basically copy the pointer
        #modifications will still be on the original object
        
        #here is where the extra O's get put in, because place_piece keeps updating the board
        move_score_array = computer_move_scores(board, player, poss_moves_cpu)
        
        max_score = move_score_array.max
        
        #recal that Ruby indexes run from 0 to n-1 for array of n values
        max_score_index = move_score_array.find_index(max_score)
        
        #match the highest score with the corresponding move
        best_move = poss_moves_cpu[max_score_index]
        
        return(best_move)
        
    end

        
    def computer_move_2(board, player)
       
        #we call the helper function best_computer_move_2 to get the best move
        
        tempboard = array_dup(board)
        
        best_move = best_computer_move_2(tempboard, player)
        
        #now we play the move
        new_board = place_piece(board, player, best_move[0], best_move[1])
        
        session[:board] = new_board
        
        #switch to human move
        session[:player] = "X"                
        redirect_to("/")
        
    end
    
    
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
        
        #understand whos turn to process, or if the game ended
        if @victor == "ongoing"
            if @curr_player == "X"
                #this is human player, by defn
                #player_move is only after we submit the form -- if we run it here, there's nothing submitted to params
                render("/index.html.erb")
            elsif @curr_player == "O"
                computer_move_2(@curr_board, "O")
            end
        else
            #we stop the game -- no more moves
            render("/index.html.erb")
        end

    end
    
    
end