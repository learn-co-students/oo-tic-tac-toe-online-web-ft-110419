require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ]
    
  def initialize
    @board = Array.new(9," ")
  end
  
  def display_board
    puts " X | O | O "
    puts "-----------"
    puts " X | X | X "
    puts " X | O | X "
    puts " O | X | X "
    puts " O | X | O "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index,player_mark)
    @board[index] = player_mark
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    @board[index] != "X" && @board[index] != "O" if @board[index]
  end
  
  def turn_count
    @board.count {|player|  player == "X" ||  player == "O"}
  end
  
  def current_player
    self.turn_count % 2 == 0 ? "X"  : "O"
  end
  
  def turn
    puts "Please enter a number (1-9): "
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

end