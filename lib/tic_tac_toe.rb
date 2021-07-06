require 'pry'
class  TicTacToe
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[4,7,1],[2,5,8],[0,4,8],[6,4,2]]
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]     #initialize when new game is created
    
  end
  
  def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "  #board display 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
         
  end
  
  def input_to_index(index)
      index.to_i - 1                                               #input from users
      #bi1nding.pry

  end
                                            #  location = 0     token = x
                                            
    def move(location, token="X")        #      move( 0 , O )            
    @board[location] = token
    #binding.pry
  end
  
    def position_taken?(location)   #postion is not empty 
       @board[location]=="X" || @board[location]=="O"
       
    end
     def valid_move?(index)
       !position_taken?(index) && index.between?(0,8) #if postion is not taking and board size between range of 0 to 8 than input from users  is a valide move 
       #binding.pry
       
     end
     def turn_count
        @board.count {|player| player == "X" || player == "O"} #this is going to return amount of time X and O exist 
        #binding.pry
     end
     def current_player   #return correct player X for the third move 
         turn_count % 2 == 0 ? "X" : "O"
     end
    def turn
        input = gets.strip               #The placement of X on board 
        index = input_to_index(input)
        #binding.pry
        if valid_move?(index)   
          move(index,current_player)                                                  #if valide_move is                true then i can move to play game
        else
          turn 
        end
        display_board 
    end
    
     def won?
        combo = false
         WIN_COMBINATIONS.each do |array|
            if position_taken?(array[0]) && @board[array[0]] == @board[array[1]] && @board[array[1]] == @board[array[2]] 
               #binding.pry
              combo = array
              return combo
            end
         end
         combo
     end

     def full?
        #iterate over each element in the array that represents a space on the board, and check to see if each element is occupied  
        #only want to return true if the board is full 
        #otherwise we want to return false
        
         @board.each do |space|
            if space == "X" || space == "O"
          #do nothing
           else
           return  false 
           end
         #binding.pry
        end
     end
     
     def draw?
       #a draw is when nobody wins, meaning that the board is full, and nobody won 
       
       if full? && !won?
         return true 
       else 
         return false 
       end
     end
     
     def over? 
       #when is the game over 
       #the game is over when the board is full OR somebody won 
       
       if draw? || won?
         return true 
       else 
        return  false 
       end
    end
     
    def winner 
       #is it X or O?
       #our won? method returns the winning combination, which is an array of the 3 indices that won
       #we can use one of the 3 indices to look at our board and see whether "X" or "O" won 
          
          #binding.pry
         if won? 
           @board[won?[0]]
         end
     end
     
     def play
        turn until over?
        if won?
         puts "Congratulations #{winner}!"
       else
          puts "Cat's Game!"
      end
    end
  end
  