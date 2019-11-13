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
    # @board[index] != "X" && @board[index] != "O" && @board[index]
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    @board.count {|player|  player == "X" ||  player == "O"}
  end
  
  def current_player
    self.turn_count % 2 == 0 ? "X"  : "O"
  end
  
  def turn
    user_input = gets.chomp
    index = input_to_index(user_input)
    valid_move?(index) ? move(index,current_player) : turn
    display_board
  end
  
  def won?
    bf = @board.flatten
    result = nil
    WIN_COMBINATIONS.each do |row|
      board_values = "#{bf[row[0]]} #{bf[row[1]]} #{bf[row[2]]}".split(" ")
      plyr_x = board_values.count{|plyr| plyr == "X"}
      
    	if plyr_x == 3 || plyr_x == 0 
    		result = "#{row[0]} #{row[1]} #{row[2]}".split.map{|n| n.to_i}
    	end
    	
    end
    result
  end
  
end